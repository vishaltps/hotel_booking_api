# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ApiResponseHandler
  include ApiExceptionsHandler

  before_action :authenticate_user

  def authenticate_user
    true
  end

  def current_user
    User.first
  end
end
