module Admin
  class TasksController < ApplicationController
    include AdminContext
    before_action :set_task, only: %i[show edit update destroy]

    def index
      @pagy, @collection = pagy_countless(tasks_scope)
    end

    def show; end

    def new
      @task = project.tasks.new
    end

    def edit; end

    def create
      @task = project.tasks.new(task_params)

      respond_to do |format|
        if @task.save
          format.html { redirect_to admin_project_task_path(@project, @task), notice: 'Task was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to admin_project_tasks_path(@project), notice: 'Task was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @task.destroy

      respond_to do |format|
        format.html { redirect_to admin_project_tasks_path(@project), notice: 'Task was successfully destroyed.' }
      end
    end

    private

    def tasks_scope
      project.tasks.order(:scoped_number)
    end

    def project
      @project ||= Project.find(params[:project_id])
    end

    def set_task
      @task = project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :priority, :owner_id, :description)
    end
  end
end
