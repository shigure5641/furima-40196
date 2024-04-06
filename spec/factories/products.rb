FactoryBot.define do
  factory :product do
    association :user, factory: :user
    name { Faker::Name.name }
    describe { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id { Faker::Number.between(from: 2, to: 4) }
    product_price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end