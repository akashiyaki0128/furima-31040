require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it 'Image,Name,Note,Category,Condition,Postage player,Prefecture,Handling time,Priceがあれば登録できる' do
        expect(@item).to be_valid
      end

      it 'priceが（300~9999999）の金額の範囲内且つ半角数字であれば登録できる' do
        @item.price = '500'
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'noteが空だと登録できない' do
        @item.note = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Note can't be blank")
      end
      it 'category_idが空だと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと登録できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'postage_player_idが空だと登録できない' do
        @item.postage_player_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage player can't be blank")
      end
      it 'prefecture_idが空だと登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'handling_time_idが空だと登録できない' do
        @item.handling_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Handling time can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be selected')
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be selected')
      end
      it 'postage_player_idが1だと登録できない' do
        @item.postage_player_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage player must be selected')
      end
      it 'prefecture_idが0だと登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be selected')
      end
      it 'handling_time_idが1だと登録できない' do
        @item.handling_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Handling time must be selected')
      end
      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが10,000,000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが全角だと登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
