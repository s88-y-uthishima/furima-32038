FactoryBot.define do
  factory :order_form do
    token         { 'tok_1234567890' }
    post_code     { '098-6758' }
    prefecture_id { 1 }
    city          { '稚内市' }
    address_line  { '3' }
    building      { '最北端' }
    phone_number  { '09012345678' }
    user_id       { 1 }
    item_id       { 1 }
  end
end
