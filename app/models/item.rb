class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_of_ship

  has_many :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info
  end

  with_options numericality: { other_then: 0 } do
    validates :category
    validates :condition
    validates :shipping_charge
    validates :prefecture
    validates :days_of_ship
  end

  validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
