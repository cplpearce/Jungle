class Admin::DashboardController < ApplicationController

  # A D M I N   A U T H
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  # S H O W   D E F A U L T
  def show
    @products = Product.count
    @categories = Category.count
  end
end
