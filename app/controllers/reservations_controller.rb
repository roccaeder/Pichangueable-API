class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    if previus_reservation_exists?
      render json: @reservations.errors, status: :unprocessable_entity
    else
      @reservation = Reservation.new
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  #   def reservation_params
  #     previus_reservation_exists = Reservation.find(params[:id, :start_date_hour, :end_date_hour])
  #   end
end
