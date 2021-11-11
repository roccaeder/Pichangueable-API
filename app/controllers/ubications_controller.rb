class UbicationsController < ApplicationController
  before_action :require_login, except: %i[index]

  def index
    @ubications = Ubication.all
    render json: @ubications
  end

  def create
    @ubication = Ubication.new(ubication_params)
    if @ubication.save
      render json: @ubication
    else
      render json: @ubication.errors, status: :unprocessable_entity
    end
  end

  private

  def ubication_params
    params.permit(:district, :departament)
  end
end
