FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.word }
    description         { Faker::Lorem.sentence }
    category_id         { 1 }
    condition_id        { 1 }
    cost_beaver_id      { 1 }
    shipment_area_id    { 1 }
    preparation_days_id { 1 }
    price               { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
