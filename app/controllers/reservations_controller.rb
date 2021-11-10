class ReservationsController < ApplicationController
  before_action :require_login! % i[index]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    if previus_reservation_exists.empty?
      render json: @reservations.errors, status: :unprocessable_entity
    else
      @reservation = Reservation.new
      @reservation.save
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

  private

  def previus_reservation_exists(newreservation)
    first_comparation = reservation.end_date_hour <= newreservation.end_date_hour
    second_comparation = reservation.end_date_hour >= newreservation.start_date_hour
    third_comparation = reservation.start_date_hour <= newreservation.end_date_hour
    fourth_comparation = reservation.start_date_hour >= newreservation.start_date_hour

    Reservation.select do |_reservation|
      (first_comparation && second_comparation) || (third_comparation && fourth_comparation)
    end
  end
end

# Reservation.select{|reservation| (reservation.end_date_hour <= (newreservation.end_date_hour)
#                      && reservation.end_date_hour >= (newreservation.start_date_hour))
#                      || (reservation.start_date_hour <= (newreservation.end_date_hour)
#                     && reservation.start_date_hour >= (newreservation.start_date_hour))}
