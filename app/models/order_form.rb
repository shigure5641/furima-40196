class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user_id, :product_id

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :user_id
    validates :product_id
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, municipalities: municipalities,
    street_address: street_address, building_name: building_name, telephone_number: telephone_number)
  end
end