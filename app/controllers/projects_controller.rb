class ProjectsController < ApplicationController
  before_action :load_project, only: [:edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to root_path, notice: 'Project updated'
    else
      render 'edit'
    end      
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path, notice: 'Project created'
    else
      render 'new'
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :client, :archived)
    end

    def load_project
      @project = Project.find_by(id: params[:id])
    end
end


