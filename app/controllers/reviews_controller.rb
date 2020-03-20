class ReviewsController < ApplicationController

  def create
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id]) #restaurant id the paremtized url
    @review = Review.new(my_review_strong_params)
    @review.restaurant = @restaurant # thanks to the belongs_to in review model
    if @review.save
      respond_to do |format|
        # if browser allows us js render format.js otherwise render format.html
        format.html { redirect_to restaurant_path(@restaurant) } #people using browsers witj js not enabled
        format.js #ajax working# <-- w ill render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js  # <-- idem
      end
     # render 'restaurants/show' # im rednering the form that is insidwe of my restaurants show page#thanks to simple form you ll see the validations error
    end
  end


  private

  def my_review_strong_params
    params.require(:review).permit(:content)
  end
end
