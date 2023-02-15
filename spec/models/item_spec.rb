require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    context '商品出品ができるとき' do
      it '全ての入力事項が存在するとき出品可'do
      end
      it 'カテゴリーが「---」以外の時出品可'do
      end
      it '配送料の負担が「---」以外の時出品可'do
      end
      it '商品状態が「---」以外の時出品可'do
      end
      it '発送元地域が「---」以外の時出品可'do
      end
      it '発送日数が「---」以外の時出品可'do
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば出品可'do
      end
    end
    context '出品ができないとき' do
      it 'ユーザー登録していないと出品不可' do
      end
      it '商品名がないと出品不可' do
      end
      it '商品説明がないと出品不可' do
      end
      it '画像なしだと出品不可' do
      end
      it 'カテゴリーが「---」の時出品不可' do
      end
      it '商品状態が「---」の時出品不可' do
      end
      it '発送元の地域が「---」の時出品不可' do
      end
      it '配送料の負担が「---」の時出品不可' do
      end
      it '価格がないと出品不可' do
      end
      it '発送日の情報が「---」の時出品不可' do
      end
      it '価格が300円未満の時出品不可' do
      end
      it '価格が9,999,999円を超えると出品不可' do
      end
    end
  end
end
