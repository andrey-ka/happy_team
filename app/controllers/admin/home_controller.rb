module Admin
  class HomeController < ApplicationController
    include AdminContext

    def index
      set_personal_tasks
    end

    private

    def set_personal_tasks
      @personal_tasks = current_member.tasks.focusable
    end
  end
end
