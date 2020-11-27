class ItemPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :Item
  has_one :buyer_address

end
