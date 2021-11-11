class ReservationsController < ApplicationController
  # before_action :require_login % i[index]
  before_action :require_login, except: %i[index]

  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if previus_reservation_exists(@reservation).empty?
      @reservation.user_id = current_user.id
      @reservation.save
      render json: @reservation
    else
      render json: @reservations.errors, status: :unprocessable_entity
    end
    # render json: @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    validreservation = Reservation.new(reservation_params)
    if previus_reservation_exists(validreservation).empty?
      reservation_params.user_id = current_user.id
      @reservation.update(reservation_params)
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
    Reservation.all.select do |reservation|
      first_comparation = reservation.end_date_hour <= newreservation.end_date_hour
      second_comparation = reservation.end_date_hour >= newreservation.start_date_hour
      third_comparation = reservation.start_date_hour <= newreservation.end_date_hour
      fourth_comparation = reservation.start_date_hour >= newreservation.start_date_hour
      (first_comparation && second_comparation) || (third_comparation && fourth_comparation)
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date_hour, :end_date_hour, :total, :field_id)
  end
end

# Reservation.select{|reservation| (reservation.end_date_hour <= (newreservation.end_date_hour)
#                      && reservation.end_date_hour >= (newreservation.start_date_hour))
#                      || (reservation.start_date_hour <= (newreservation.end_date_hour)
#                     && reservation.start_date_hour >= (newreservation.start_date_hour))}
