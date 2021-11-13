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
    @field.user_id = current_user.id
    if @field.save
      render json: @field
    else
      render json: @field.errors, status: :unprocessable_entity
    end
    # render json: params
  end

  def show
    field = Field.find(params[:id])
    # pp field.images.map{ |image| ({image: url_for(image)})}
    render json: field.as_json.merge({ images: field.images.map do |image|
                                                 { image_url: url_for(image) }
                                               end })
  end

  def update
    @field = Field.find(params[:id])
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
    params.permit(:name, :summary, :field_type, :sport_type, :address, :capacity, :price_hour,
                  :images, :ubication_id, :published_at)
  end
end
