FactoryBot.define do
  factory :buyer_data do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 13 }
    city { '杉並区' }
    house_number { '高円寺南2-37-17' }
    building_name { '高円寺ビル２F' }
    telephone_number { '09011111111' }
  end
end
