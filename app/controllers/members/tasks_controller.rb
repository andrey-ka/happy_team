module Members
  class TasksController < ApplicationController
    include MemberContext
    before_action :set_task, only: %i[update]

    def index
      @pagy, @collection = pagy_countless(tasks_scope)
    end

    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to member_tasks_path(@project), notice: t('pages.member.tasks.success_notice') }
          format.json { render json: { message: t('pages.member.tasks.success_notice') } }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: { message: t('pages.member.tasks.failure_notice') }, status: :unprocessable_entity }
        end
      end
    end

    private

    def tasks_scope
      current_member
        .tasks
        .includes(:project)
        .priority
    end

    def set_task
      @task = current_member.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:state)
    end
  end
end
