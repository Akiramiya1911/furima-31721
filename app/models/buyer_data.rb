class BuyerData

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly" }
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{1,11}\z/, message: "Input only number"}, length: { maximum: 11 }
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, item_id: item_id)
    BuyerAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, item_purchase_id: item_purchase.id)
  end
end