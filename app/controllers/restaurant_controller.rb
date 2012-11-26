class RestaurantController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.order( 'name ASC').page(params[:page])
  end
end
