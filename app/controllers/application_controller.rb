<<<<<<< HEAD
class ApplicationController < ActionController::Base
end
=======
class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :require_login!

  def require_login!
    authenticate_token || render_unauthorized("Access denied")
  end

  def current_user
    @current_user ||= authenticate_token
  end

  private

  def render_unauthorized(message)
    errors = { errors: [message] }
    render json: errors, status: :unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.where(["token = ? and token_created_at >= ?", token, 1.hour.ago]).first
    end
  end
end
>>>>>>> 042e8a3beb5592c28036ee89915d63e20595830e
