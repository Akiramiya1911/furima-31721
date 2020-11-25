class ChangeDataItemPriceToItems < ActiveRecord::Migration[6.0]
  def change
    change_column :items, :item_price, :string
  end
end
