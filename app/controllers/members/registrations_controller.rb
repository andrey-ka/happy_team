# frozen_string_literal: true

module Members
  class RegistrationsController < Devise::RegistrationsController
    # rubocop:disable  Rails/LexicallyScopedActionFilter
    before_action :configure_sign_up_params, only: [:create]
    # rubocop:enable  Rails/LexicallyScopedActionFilter
    protected

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    end

    # The path used after sign up.
    def after_sign_up_path_for(_)
      member_tasks_path
    end
  end
end
