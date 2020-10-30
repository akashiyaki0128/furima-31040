require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入' do
    before do
      @order = FactoryBot.build(:user_order)
    end
    
    context '商品購入がうまくいくとき' do
      it '全ての情報があれば購入できる' do
        expect(@order).to be_valid
      end
      
      it 'buildingがなくても登録できる' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    
    context '商品購入がうまくいかないとき' do
      it 'postal_codeがないと登録できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idがないと登録できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank", "Prefecture must be selected")
      end
      it 'cityが空だと登録できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空だと登録できない' do
        @order.street = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Street can't be blank")
      end
      it 'Phone_numberが空だと登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空だと登録できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeにハイフンが無いと登録できない' do
        @order.postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'Phone_numberにハイフンが入っていると登録できない' do
        @order.phone_number = "050-552-345"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end

# binding.pry