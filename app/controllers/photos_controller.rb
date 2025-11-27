class PhotosController < ApplicationController
  def index
    @photos = current_user.photos.order(created_at: :desc)
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
      @photos = current_user.photos.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def photo_params
    params.require(:photos)
  end
end
