class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id).order(created_at: :desc)
    @review_avg = Review.average(:rating).to_s
    @review = Review.new
  end

  def create
    @product = Product.find params[:id]
    @review = Review.new
  end
  
end
