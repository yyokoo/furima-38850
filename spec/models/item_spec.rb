require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録' do
    context '商品出品ができるとき' do
      it '全ての入力事項が存在するとき出品可' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外の時出品可' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外の時出品可' do
        @item.shipping_cost_id = 1
        expect(@item).to be_valid
      end
      it '商品状態が「---」以外の時出品可' do
        @item.item_status_id = 1
        expect(@item).to be_valid
      end
      it '発送元地域が「---」以外の時出品可' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送日数が「---」以外の時出品可' do
        @item.shipping_day_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば出品可' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end
    context '出品ができないとき' do
      it 'ユーザー登録していないと出品不可' do
        @item.user_id = nil
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '商品名がないと出品不可' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明がないと出品不可' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '画像なしだと出品不可' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'カテゴリーが「---」の時出品不可' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品状態が「---」の時出品不可' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 0")
      end
      it '発送元の地域が「---」の時出品不可' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '配送料の負担が「---」の時出品不可' do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
      end
      it '価格がないと出品不可' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '発送日の情報が「---」の時出品不可' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 0")
      end
      it '価格が300円未満の時出品不可' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円を超えると出品不可' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格に半角数字以外が含まれている場合出品不可' do
        @item.price = '33q'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'カテゴリーに「---」が空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態に「---」が空では出品できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '配送料の負担に「---」が空では出品できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域に「---」が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数に「---」が空では出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

    end
  end
end
