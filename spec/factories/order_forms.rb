FactoryBot.define do
  factory :order_form do
    postcode { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    municipalities { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    telephone_number { Faker::Number.leading_zero_number(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end
