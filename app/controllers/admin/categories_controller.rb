class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @product.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
end