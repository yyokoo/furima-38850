FactoryBot.define do
  factory :item do
    association :user
    
    name { Faker::name.name}
    description { Faker::Lorem.sentence}
    category_id { Faker::Number.between(form: 1, to: 10) }
    item_status_id {Faker::Number.between(form: 1, to: 6) }
    shipping_cost_id {Faker::Number.between(form: 1, to: 2) }
    shipping_day_id {Faker::Number.between(form: 1, to: 3) }
    prefecture_id{Faker::Number.between(form: 1, to: 47) }
    price {Faker::Number.between(form: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
