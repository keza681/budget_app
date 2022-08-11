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
      flash[:notice] = 'You have successfully created a category, congratulations...'
    else
      flash.now[:notice] = 'Oups!!! Failed to created a category, retry later...'
    end
    redirect_to root_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'You have destroyed a Category successfully, Congratulations...'
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
