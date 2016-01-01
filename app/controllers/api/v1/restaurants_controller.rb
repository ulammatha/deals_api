class Api::V1::RestaurantsController < ApiController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  def index
    @restaurants = Restaurant.all

    render json: @restaurants
  end

  def show
    render json: @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: :created, location: false
    else
      render_unprocessable_entity_response(@restaurant.errors)
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      head :no_content
    else
      render_unprocessable_entity_response(@restaurant.errors)
    end
  end

  def destroy
    @restaurant.destroy

    head :no_content
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :description, :phone, :email, :address, :rating, :image, :vendor_id)
    end
end
