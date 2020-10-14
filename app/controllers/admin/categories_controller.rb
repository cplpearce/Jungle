class Admin::CategoriesController < ApplicationController
  
  # A D M I N    A U T H
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  # D E F A U L T 
  def index
    @categories = Category.all
    @products = Product.all
  end

  # N E W   C A T E G O R Y
  def new
    @category = Category.new
  end

  # C R E A T E   A C T I O N
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  # V A L I D A T E   N A M E
  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end