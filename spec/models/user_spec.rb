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
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
  
      it "emailが空では登録できない" do
        @user.email = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
  
      it "passwordが空だと登録できない" do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
  
      it "passwordが英字のみでは登録できない" do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
      end
  
      it "passwordが数字のみでは登録できない" do
        @user.password = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
      end
  
      it "passwordが全角文字を含む場合は登録できない" do
        @user.password = 'aaa０00' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password must be a combination of letters and numbers"
      end
  
      it 'パスワードが6文字未満では登録できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

     end

  end

end