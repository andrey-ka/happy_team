# frozen_string_literal: true
module Members
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    protected

    def after_sign_in_path_for(member)
      member.admin_role? ? admin_home_path : member_tasks_path
    end
  end
end
