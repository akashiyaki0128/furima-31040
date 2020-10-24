require 'rails_helper'

RSpec.describe User, type: :model do
  describe "新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    
    # binding.pry
    
    # context '新規登録がうまくいくとき' do
    #   it "nicknameとemail、passwordとpassword_confirmation、名前、名字、名前（フリガナ）名字（フリガナ）、生年月日が存在すれば登録できる" do
    #     binding.pry
    #     expect(@user).to be_valid
    #   end
      
    #   it "passwordが6文字以上であれば登録できる" do
    #     @user.password = "asdddd"
    #     @user.password_confirmation = "asdddd"
    #     expect(@user).to be_valid
    #   end
    # end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname= "a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは＠がなければ登録できない" do
      end
      
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "33333"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザー本名は、名字が空では登録できない" do
      end
      it "ユーザー本名は、名前が空では登録できない" do
      end
      it "ユーザー本名のフリガナは、名字が空では登録できない" do
      end
      it "ユーザー本名のフリガナは、名前が空では登録できない" do
      end
      it "ユーザー本名は、名字が全角以外では登録できない" do
      end
      it "ユーザー本名は、名前が全角以外では登録できない" do
      end
      it "ユーザー本名のフリガナは、名字が全角カタカナ以外では登録できない" do
      end
      it "ユーザー本名のフリガナは、名前が全角カタカナ以外では登録できない" do
      end
      it "生年月日が空では登録できない" do
      end
    end
  
    


  end  
end

