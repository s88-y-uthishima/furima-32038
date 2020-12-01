class OrderForm
  include ActiveModel::Model
 
  attr_accessor : :user_id, :item_id, :post_code, :prefecture_id, :city, :address_line, :building, :phone_number
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address_line
    validates :phone_number
  end
  validates :building

  def save
    Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address_line: address_line, building: building, phone_number: phone_number)
  end
end