require 'rails_helper'

RSpec.describe BuyerData, type: :model do
  before do
    @buyer_data = FactoryBot.build(:buyer_data)
  end

  describe '商品購入機能' do
    context '保存がうまくいくとき' do
      it '全ての情報が存在すると保存できること' do
        expect(@buyer_data).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @buyer_data.building_name = nil
        expect(@buyer_data).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'tokenが空だと保存できないこと' do
        @buyer_data.token = nil
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @buyer_data.postal_code = nil
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフン(-)がないと保存できないこと' do
        @buyer_data.postal_code = '1234567'
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefenture_idが空だと保存できないこと' do
        @buyer_data.prefecture_id = nil
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが0だと保存できないこと' do
        @buyer_data.prefecture_id = 0
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと保存できないこと' do
        @buyer_data.city = nil
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @buyer_data.house_number = nil
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @buyer_data.telephone_number = nil
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberにハイフン(-)があると保存できないこと' do
        @buyer_data.telephone_number = '090-0000-0000'
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include('Telephone number Input only number')
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @buyer_data.telephone_number = '090000000000'
        @buyer_data.valid?
        expect(@buyer_data.errors.full_messages).to include('Telephone number is too long (maximum is 11 characters)')
      end
    end
  end
end
