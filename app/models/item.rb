class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_of_ship

  belongs_to :user
  has_one :item_purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
  end

  with_options presence: true, numericality: { other_than: 0, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_of_ship_id
  end

  validates :item_price, presence: true, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
