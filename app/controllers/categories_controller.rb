class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @user = current_user
    @categories = current_user.categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      flash[:notice] = 'Congratulations... Your Category was successfully created.'
    else
      flash.now[:notice] = 'Oups! Impossible to created to create a category'
    end
    redirect_to root_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Oups! Category removed successfully'
    redirect_to root_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
