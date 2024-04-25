class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]


  def index
    @order_form = OrderForm.new
end

def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
end

  private

  def order_params
    binding.pry
    params.require(:order_form).permit(:postcode, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def non_purchased_item
    @item = Product.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

end
