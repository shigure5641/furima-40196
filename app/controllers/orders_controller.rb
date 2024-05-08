class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :municipalities, :street_address,
                                       :building_name, :telephone_number).merge(token: params[:token], user_id: current_user.id, product_id: params[:item_id])
  end

  def non_purchased_item
    @item = Product.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.product_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
