class SessionsController < ApplicationController
  skip_before_action :require_login, only: :create

  def create
    user = User.find_by(email: params[:email])
    if user.valid_password?(params[:password])
      user.regenerate_token
      render json: user, status: :ok
    else
      render_unauthorized("Incorrect email or password")
    end
  end

  def destroy
    current_user.invalidate_token
    head :no_content
  end
end
