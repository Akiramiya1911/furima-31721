require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '保存がうまくいくとき' do
      it 'image,item_name,item_infoがあり、category_id,condition_id,shipping_charge_id,prefecture_id,days_of_ship_idが0以外であり、item_priceが300~9999999の半角数字であるとき、保存できる' do
        expect(@item).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空だと保存できない' do
        @item.item_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'category_idが空だと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが0だと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'condition_idが空だと保存できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが0だと保存できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'shipping_charge_idが空だと保存できない' do
        @item.shipping_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'shipping_charge_idが0だと保存できない' do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping charge Select')
      end
      it 'prefecture_idが空だと保存できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture Select')
      end
      it 'days_of_ship_idが空だと保存できない' do
        @item.days_of_ship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days of ship can't be blank")
      end
      it 'days_of_ship_idが0だと保存できない' do
        @item.days_of_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Days of ship Select')
      end
      it 'item_priceが空だと保存できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが半角数字でないと保存できない' do
        @item.item_price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Half-width number')
      end
      it 'item_priceが299以下だと保存できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Out of setting range')
      end
      it 'item_priceが10000000以上だと保存できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price Out of setting range')
      end
    end
  end
end
