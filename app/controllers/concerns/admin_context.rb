module AdminContext
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_member!
    before_action :check_admin_permission!
  end

  private

  def check_admin_permission!
    return if current_member && current_member.admin_role?
    redirect_to root_path, alert: t('devise.failure.permission')
  end

end
