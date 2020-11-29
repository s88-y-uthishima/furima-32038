class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :cost_beaver
  belongs_to :shipment_area
  belongs_to :preparation_days

  with_options presence: true do
    validates :name
    validates :description
    validates :price, inclusion: { in: 300..9_999_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :cost_beaver_id
    validates :shipment_area_id
    validates :preparation_days_id
  end

  belongs_to :user
  has_one_attached :image
end
