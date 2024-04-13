class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    unless @product.user == current_user
      redirect_to root_path
    end 

  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to item_path(@product.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :describe, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                    :shipping_day_id, :product_price).merge(user_id: current_user.id)
  end
end
