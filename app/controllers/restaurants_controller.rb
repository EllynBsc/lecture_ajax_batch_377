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

  def destroy
    # need to grab the restaurant to destroy
    @restaurant = Restaurant.find(params[:id])
    # destroy it
    @restaurant.destroy
    # redirect_to restaurants_path
  end
end
