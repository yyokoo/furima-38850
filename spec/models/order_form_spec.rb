require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end
  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存ができる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存ができる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせなら保存ができる' do
        @order_form.post_code = '123-4567'
        expect(@order_form).to be_valid
      end
      it '都道府県が「---」以外かつ空で無ければ保存ができる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存ができる' do
        @order_form.city = '神戸市'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存ができる' do
        @order_form.address = '南区１−１'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存ができる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
      it '電話番号が「11桁以内ハイフンなし」であれば保存ができる' do
        @order_form.phone_number = 12_345_678_910
        expect(@order_form).to be_valid
      end

    end
    context '配送先情報が保存できないとき' do
      it 'user_idが空の時保存ができない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空の時保存ができない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空の時保存ができない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存ができない' do
        @order_form.post_code =1_123_456
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が空の時保存ができない' do
        @order_form.prefecture_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が「---」の時保存ができない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が空の時保存ができない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空の時保存ができない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空の時保存ができない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存ができない' do
        @order_form.phone_number = '123-4567-8910'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上あるとき時保存ができない' do
        @order_form.phone_number = 123_456_789_11111
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下の時保存ができない' do
        @order_form.phone_number = 123_456_78
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空だと保存ができない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
  
end

