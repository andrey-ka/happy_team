module MemberContext
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_member!
  end
end
