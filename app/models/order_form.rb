class OrderForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id, :token
 
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address_line
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :user_id
    validates :item_id
    validates :token

  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end