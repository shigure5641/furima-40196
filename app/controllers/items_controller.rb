class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :describe, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
                                    :shipping_day_id, :product_price).merge(user_id: current_user.id)
  end
end
