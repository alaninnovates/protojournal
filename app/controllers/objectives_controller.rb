class ObjectivesController < ApplicationController
  def create
    # find latest weekly journal in project
    project_id = params[:project_id]
    project = current_user.projects.find(project_id)
    latest_journal = project.journals.order(created_at: :desc).first
    @objective = latest_journal.objectives.build(objective_params.except(:project_id))
    @objective.status = "pending"
    if @objective.save
      redirect_to project_path(project_id), notice: 'Objective was successfully created.'
    else
      flash.now[:alert] = 'There was an error creating the objective.'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def objective_params
    params.require(:objective).permit(:title, :description, :due_date, :project_id)
  end
end
