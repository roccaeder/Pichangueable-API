class SessionsController < ApplicationController
  # prepend_before_filter :require_no_authentication, only: [:create]
  # include Devise::InternalHelpers

  # before_filter :ensure_params_exist
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
