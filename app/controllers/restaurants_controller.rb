class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    # raise
    @restaurant = Restaurant.find(params[:id])
    # have the form of the review inside of the show page of the restaurant
    # i need to instantiate my review object
    @review = Review.new
  end
end
