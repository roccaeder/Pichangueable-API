class UsersController < ApplicationController
  skip_before_action :require_login, only: :create

  # get profile

  # before_action :require_login, except: %i[create]

  def index
    # user = User.find(params[:id])
    render json: current_user
  end

  # sign up
  def create
    user = User.new(user_params)

    if user.save
      # render json: { id: user.id, email: user.email, token: user.token }, status: :created
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # update profile user
  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: { errors: current_user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # delete user
  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: { messages: "Deleted" }
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:email, :password, :name, :phone, :role)
  end
end
