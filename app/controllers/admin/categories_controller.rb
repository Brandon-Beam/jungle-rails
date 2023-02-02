class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"],
                               password: ENV["HTTP_BASIC_PASSWORD"]
  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end
#saves to database 
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

  private
#takes from new in views/admin
  def category_params
    params.require(:category).permit(
      :name
     
    )
  end
end
