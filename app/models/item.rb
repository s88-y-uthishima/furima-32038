class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :cost_beaver_id, presence: true
  validates :shipment_area_id, presence: true
  validates :preparation_days_id, presence: true
  validates :price, presence: true

  # validates :image, presence: true  
  
  belongs_to :user
  # has_one_attached :image
end
