class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects.order(created_at: :desc)
  end

  def show
  end
end
