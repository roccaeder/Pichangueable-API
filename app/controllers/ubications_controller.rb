class UbicationsController < ApplicationController
  def index
    @ubications = Ubication.all
    render json: @ubications
  end

  private

  def ubication_params
    params.permit(:district, :department)
  end
end
