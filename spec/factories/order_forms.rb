FactoryBot.define do
  factory :order_form do
    user_id { Faker::Number.non_zero_digit }
    product_id { Faker::Number.non_zero_digit }
    postcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipalities { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    telephone_number { Faker::Number.decimal_part(digits: 11) }
  end
end
