require 'rails_helper'

RSpec.describe ItemUserAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @information = FactoryBot.build(:item_user_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  context "商品購入がうまくいく時" do
    it "全ての値が正しく入力されていれば購入できる" do
      expect(@information).to be_valid
    end
  
    it '建物名がなくても購入できる' do
      @information.apartment = nil
      expect(@information).to be_valid
    end
  
  end

  context '商品購入がうまくいかない時' do
    it 'Tokenが空だと購入できない' do
      @information.token = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("Token can't be blank")
    end
    it '郵便番号が空だと購入できない' do
      @information.postal_code = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンがないと購入できない' do
      @information.postal_code = "1234567"
      @information.valid?
      expect(@information.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県が未選択だと購入できない' do
      @information.prefecture_id = 1
      @information.valid?
      expect(@information.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が空だと購入できない' do
      @information.city = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("City can't be blank")
    end
    it '住所が空だと購入できない' do
      @information.address = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("Address can't be blank")
    end


    it '電話番号が空だと購入できない' do
      @information.phone_number = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が数字以外では購入できない' do
      @information.phone_number = "あああああ"
      @information.valid?
      expect(@information.errors.full_messages).to include("Phone number is invalid") 
    end

    it '電話番号が9桁以下では購入できない' do
      @information.phone_number = '09000000'
      @information.valid?
      expect(@information.errors.full_messages).to include("Phone number is invalid") 
    end

    it '電話番号が12桁以上では購入できない' do
      @information.phone_number = '0900000000000000'
      @information.valid?
      expect(@information.errors.full_messages).to include("Phone number is invalid") 
    end

    it 'userが紐付いていなければ購入できない' do
      @information.user_id = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ購入できない' do
      @information.item_id = nil
      @information.valid?
      expect(@information.errors.full_messages).to include("Item can't be blank")
    end



  end









end
