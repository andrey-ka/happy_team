class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_error

  private

  def handle_not_found_error
    render 'home#not_found', status: :not_found
  end
end
