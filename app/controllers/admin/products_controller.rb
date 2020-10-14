class Admin::ProductsController < ApplicationController

  # A D M I N    A U T H
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  # S H O W   D E F A U L T
  def index
    @products = Product.order(id: :desc).all
  end

  # N E W   P R O D U C T
  def new
    @product = Product.new
  end

  # C R E A T E   A C T I O N
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  # D E L E T E   P R O D U C T
  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  # V A L I D A T E   P A R A M S
  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
