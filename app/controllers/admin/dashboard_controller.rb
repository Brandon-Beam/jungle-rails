class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
  password: ENV["HTTP_BASIC_PASSWORD"]
  #sends info to show in views/admin
  def show
    @test = Product.all
    @categories = Category.all
  end

end
