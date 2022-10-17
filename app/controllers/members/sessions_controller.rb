# frozen_string_literal: true

module Members
  class SessionsController < Devise::SessionsController

    protected

    def after_sign_in_path_for(member)
      member.admin_role? ? admin_home_path : member_tasks_path
    end
  end
end
