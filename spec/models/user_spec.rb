require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
     @user = FactoryBot.build(:user)
    end
 
     context '内容に問題ない場合' do
       it 'すべての情報があれば登録できる' do
         expect(@user).to be_valid
       end
     end

     context '内容に問題がある場合' do
      it 'ネームが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ネームを入力してください"
      end
  
      it "Eメールが空では登録できない" do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
  
      it "パスワードが空だと登録できない" do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
  
      it "パスワードが英字のみでは登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英数字混合で入力してください"
      end
  
      it "パスワードが数字のみでは登録できない" do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英数字混合で入力してください"
      end
  
      it "パスワードが全角文字を含む場合は登録できない" do
        @user.password = 'aaa０00' 
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英数字混合で入力してください"
      end
  
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end

     end

  end

end
