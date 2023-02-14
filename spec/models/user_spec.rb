require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
      context '登録できる時' do
        it '全ての項目の入力が存在できれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上かつ半角英数字混合であれば登録できること' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end

        it 'fimly_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.family_name = '山田'
          expect(@user).to be_valid
        end

        it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
          @user.first_name = '陸太郎'
          expect(@user).to be_valid
        end
        it '名字のフリガナが全角（カタカナ）であれば登録できる' do
          @user.family_name_kana = 'ヤマダ'
          expect(@user).to be_valid
        end
        it '名前のフリガナが全角（カタカナ）であれば登録できる' do
          @user.first_name_kana = 'リクタロウ'
          expect(@user).to be_valid
        end
      end
      context '新規登録が出来ない時'do
        it 'nicknameが空では保存できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = 'a123456'
          @user.password_confirmation ='b123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '重複したemailが存在する場合は登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'emailは＠を含まないと登録できない' do
          @user.email = 'testmail'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが５文字以下では登録できない' do
          @user.password = 'a1234'
          @user.password_confirmation = 'a1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordが数字のみのパスワードでは登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
        end
        it 'passwordが英字のみのパスワードでは登録できない' do
          @user.password = 'abcdef'
          @user.password_confirmation = 'abcdef'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
        end
        it 'パスワード（確認）が空欄だと保存できない' do
          @user.password = '123abc'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        
        it 'family_nameは空では登録できない' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end
        it 'family_nameは全角の漢字、ひらがな、カタカナでないと登録できない' do
          @user.family_name = 'yamada'
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end
        it 'first_nameは空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'first_nameは漢字、ひらがな、カタカナでないと登録できない' do
          @user.first_name = 'rikutaro'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it '名字のフリガナが全角（カタカナ）でないと登録できない' do
          @user.family_name_kana = 'やまだ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end
        it '名前のフリガナが全角（カタカナ）でないと登録できない' do
          @user.first_name_kana = 'りくたろう'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it '生年月日が空では登録できない' do
          @user.birth_day = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
      end
  end 
end
