class ProductsController < ApplicationController

  # D E F A L T 
  def index
    @products = Product.all.order(created_at: :desc)
  end

  # S P E C I F I C   P R O D U C T
  def show
    @product = Product.find params[:id]
  end

end
