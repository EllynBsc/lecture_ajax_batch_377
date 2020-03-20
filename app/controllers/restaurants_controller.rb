class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    # raise
    @restaurant = Restaurant.find(params[:id])
    # To have the form of the review inside of the show page of the restaurant, I need to instantiate my review object
    @review = Review.new
  end

  def destroy
    # Need to grab the restaurant to destroy
    @restaurant = Restaurant.find(params[:id])
    # Destroy it
    @restaurant.destroy
    # redirect_to restaurants_path
  end
end
