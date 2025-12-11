class PhotosController < ApplicationController
  def index
    @photos = current_user.photos.where(objective_id: nil).order(created_at: :desc)
    @projects = current_user.projects.order(created_at: :desc)
  end

  def create
    created = []
    errors = []

    photo_params.each do |p|
      if p.blank?
        next
      end
      photo = current_user.photos.build(image: p)
      if photo.save
        created << photo
      else
        errors << photo
      end
    end

    if errors.empty?
      redirect_to photos_path, notice: "#{created.size} photos were successfully uploaded."
    else
      flash.now[:alert] = "There was an error uploading some photos."
      @photos = current_user.photos.where(objective_id: nil).order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def associate
    @photo = current_user.photos.find(params[:id])
    @photo.update(objective_id: params[:objective_id])
    render json: { success: true }
  end

  def update
    @photo = current_user.photos.find(params[:id])

    if @photo.update(description: params[:photo][:description])
      @objective = @photo.objective
      render turbo_stream: turbo_stream.replace("photo_#{@photo.id}", partial: "projects/objective_photo", locals: { photo: @photo, objective: @objective })
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    @photo.image.purge
    @photo.destroy
  end

  private

  def photo_params
    params.require(:photos)
  end
end
