class ReviewsController < ApplicationController

  def create
    # raise
    @restaurant = Restaurant.find(params[:restaurant_id]) #restaurant id the parametized url
    @review = Review.new(my_review_strong_params)
    @review.restaurant = @restaurant # thanks to the belongs_to in review model
    if @review.save
      respond_to do |format|
        # if browser does not allows us js : render format.html
        format.html { redirect_to restaurant_path(@restaurant) } #people using browsers witj js not enabled
        # if browser allows us js to be render: render format.js
        format.js #ajax working # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' } #I'm rendering the form that is inside of my restaurants show page
        format.js  # <-- idem
      end

    end
  end


  private

  def my_review_strong_params
    params.require(:review).permit(:content)
  end
end
