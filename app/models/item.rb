class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost_beaver
  belongs_to :shipment_area
  belongs_to :preparation_days

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :cost_beaver_id, numericality: { other_than: 0 }
  validates :shipment_area_id, numericality: { other_than: 0 }
  validates :preparation_days_id, numericality: { other_than: 0 }
  validates :price, presence: true, inclusion: { in: 300..9_999_999_999 }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
end
