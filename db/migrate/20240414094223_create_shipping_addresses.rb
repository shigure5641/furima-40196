class CreateShippingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_addresses do |t|
      t.references :order,            null: false, foreign_key: true
      t.string     :postcode,         null: false
      t.integer    :prefecture_id,    null: false
      t.string     :municipalities,   null: false
      t.string     :street_address,   null: false
      t.string     :building_name
      t.string     :telephone_number, null: false
      t.timestamps
    end
  end
end
