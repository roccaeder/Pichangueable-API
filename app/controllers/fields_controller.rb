class FieldsController < ApplicationController
  def index
    @fields = fields.all
    render json @fields
  end

  # new field
  def create
    @field = Field.new(field_params)
  end

  def show
    render json: current_field
  end

  def update
    if @field.update(field_params)
      render json: @field
    else
      render json: @field.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @field.destroy
  end

  private

  def field_params
    params.permit(:name, :summary, :field_type, :sports_type, :address, :capacity, :price_hour)
  end
end
