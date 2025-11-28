class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects.order(created_at: :desc)
  end

  def show
    @project = current_user.projects.find(params[:id])
    @most_recent_journal = @project.journals.order(created_at: :desc).first
    
    respond_to do |format|
      format.html
      format.json do
        journals = @project.journals.order(week_start: :desc).map { |j| 
          { id: j.id, week_start: j.week_start, week_end: j.week_end } 
        }
        render json: journals
      end
    end
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.status = "active"
    if @project.save
      redirect_to project_path(@project), notice: 'Project was successfully created.'
    else
      flash.now[:alert] = 'There was an error creating the project.'
      render :index, status: :unprocessable_entity
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :description, :status, :name)
  end
end
