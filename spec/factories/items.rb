FactoryBot.define do
  factory :item do
    item_name          { Faker::String.random(length: 1..40) }
    item_info          { Faker::String.random(length: 1..1000) }
    category_id        { Faker::Number.within(range: 1..10) }
    condition_id       { Faker::Number.within(range: 1..6) }
    shipping_charge_id { Faker::Number.within(range: 1..2) }
    prefecture_id      { Faker::Number.within(range: 1..47) }
    days_of_ship_id    { Faker::Number.within(range: 1..3) }
    item_price         { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'test-image.png')
    end
  end
end
