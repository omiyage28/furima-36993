require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do
    
    context '商品情報の入力がうまくいかない時' do
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it '名前が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '説明文が空だと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが未選択だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it 'ステータスが未選択だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '郵便送付方法が未選択だと出品できない' do
        @item.shipping_method_id = 0
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '都道府県が未選択だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it '到着予定日程が未選択だと出品できない' do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages)
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = '１０００００'
        @item.valid?
        expect(@item.errors.full_messages)

      end
    end
  end
end