class FieldsController < ApplicationController
  # before_action :require_login % i[index]
  before_action :require_login, except: %i[index]

  def index
    @fields = Field.all
    render json: @fields
  end

  # new field
  def create
    @field = Field.new(field_params)
  end

  def show
    field = Field.where(id: params[:id])
    render json: field
  end

  def update
    if @field.update(field_params)
      render json: @field
    else
      render json: @field.errors, status: :unprocessable_entity
    end
  end

  def destroy
    field = Field.find(params[:id])
    field.destroy
  end

  private

  def field_params
    params.permit(:name, :summary, :field_type, :sports_type, :address, :capacity, :price_hour)
  end
end
