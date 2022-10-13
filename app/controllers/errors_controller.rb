class ErrorsController < ApplicationController
  protect_from_forgery with: :null_session

  def not_found; end

  def application_error; end
end
