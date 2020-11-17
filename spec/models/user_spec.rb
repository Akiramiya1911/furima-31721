require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it '全ての値が正しく入力されていれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが重複していると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空だと登録できないこと' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下だと登録できないこと' do
      @user.password = 'yama0'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'yamada'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end
    it 'passwordとpassword_confirmationが一致しないと登録できないこと' do
      @user.password = 'yamada01'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角でないと登録できないこと' do
      @user.last_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name Full-width characters')
    end
    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角でないと登録できないこと' do
      @user.first_name = 'Takao'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end
    it 'last_name_kanaが空だと登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが全角でないと登録できないこと' do
      @user.last_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
    end
    it 'first_name_kanaが空だと登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが全角でないと登録できないこと' do
      @user.first_name_kana = 'ﾀｶｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
    end
    it 'birth_dateが空だと登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end
