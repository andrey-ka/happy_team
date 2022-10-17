module Admin
  class ProjectsController < ApplicationController
    before_action :set_project, only: %i[show edit update destroy]

    def index
      @pagy, @collection = pagy_countless(projects_scope)
    end

    def show; end

    def new
      @project = Project.new
    end

    def edit; end

    def create
      @project = Project.new(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to admin_project_path(@project), notice: 'Project was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to admin_project_path(@project), notice: 'Project was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @project.destroy

      respond_to do |format|
        format.html { redirect_to admin_projects_path, notice: 'Project was successfully destroyed.' }
      end
    end

    private

    def projects_scope
      Project.order(:code)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :code, :state, :objective_type, :description)
    end
  end
end
