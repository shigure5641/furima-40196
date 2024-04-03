class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :name,             null: false
      t.text       :describe,         null: false
      t.integer    :category_id,      null: false
      t.integer    :status_id,        null: false
      t.integer    :shipping_cost_id, null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :shipping_day_id,  null: false
      t.integer    :product_price,    null: false
      t.timestamps
    end
  end
end
