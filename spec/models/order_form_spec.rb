require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
      end
      it 'user_idが空でなければ保存ができる' do
      end
      it 'item_idが空でなければ保存ができる' do
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせなら保存ができる' do
      end
      it '都道府県が「---」以外かつ空で無ければ保存ができる' do
      end
      it '市区町村が空でなければ保存ができる' do
      end
      it '番地が空でなければ保存ができる' do
      end
      it '電話番号が「11桁以内ハイフンなし」であれば保存ができる' do
      end

    end
    context '配送先情報が保存できないとき' do
      it 'user_idが空の時保存ができない' do
      end
      it 'item_idが空の時保存ができない' do
      end
      it 'user_idが空の時保存ができない' do
      end
      it '郵便番号が空の時保存ができない' do
      end
      it '郵便番号にハイフンがないと保存ができない' do
      end
      it '都道府県が空の時保存ができない' do
      end
      it '都道府県が「---」の時保存ができない' do
      end
      it '市区町村が空の時保存ができない' do
      end
      it '番地が空の時保存ができない' do
      end
      it '電話番号が空の時保存ができない' do
      end
      it '電話番号にハイフンがあると保存ができない' do
      end
      it '電話番号が12桁以上あるとき時保存ができない' do
      end
      it 'トークンが空だと保存ができない' do
      end
    end
  end
  
end

