class Order_Form
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipalities, :street_address,
  :building_name, :telephone_number, :user_id, :product_id, :token
  with_options presence: true do
    validates :postcode
    validates :prefecture_id
    validates :municipalities
    validates :street_address
    validates :telephone_number
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    shipping_address.create(order_id: order_id, postcode: postcode, prefecture_id: prefecture_id, municipalities,municipalities,
    street_address: shipping_address, building_name: building_name, telephone_number: telephone_number)
    
  end
end