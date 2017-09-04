class ReviewsController < ApplicationController
  before_action :authorize

  # Create a new product review
    def create
        @review = Review.new(review_params)
        @review.product_id = params[:product_id]
        @review.user = current_user
        @review.save

        @product = Product.find params[:product_id]
        if @review.save
        redirect_to product_path(@product), notice: 'Review Saved!'
        else
        redirect_to product_path(@product)
        end
    end

  # Delete a product review
    def destroy
        @review = Review.find params[:id]
        @review.destroy
        @product = Product.find params[:product_id]
        redirect_to product_path(@product), notice: 'Review deleted!'
    end

    private

    def review_params
        params.require(:review).permit(
        :description,
        :rating
        )
    end
end
