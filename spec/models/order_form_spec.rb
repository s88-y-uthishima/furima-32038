require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '商品購入機能' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    describe '商品購入' do
      context '商品購入できる' do
        it '必須情報が全てあるとき' do
          expect(@order_form).to be_valid
        end
      end
      context '商品購入できない' do
        it 'カード情報がないとき' do
          @order_form.token = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Token can't be blank")
        end
        it '郵便番号がないとき' do
          @order_form.post_code = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Post code can't be blank")
        end
        it '郵便番号にハイフンが入ってないとき' do
          @order_form.post_code = '1234567'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include('Post code is invalid')
        end
        it '都道府県が選択されていないとき' do
          @order_form.prefecture_id = 0
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include('Prefecture must be other than 0')
        end
        it '市町村が書かれていないとき' do
          @order_form.city = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City can't be blank")
        end
        it '番地が書かれていないとき' do
          @order_form.address_line = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Address line can't be blank")
        end
        it '電話番号が書かれていないとき' do
          @order_form.phone_number = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号にハイフンが書かれ、11桁を超えているとき' do
          @order_form.phone_number = '090-1234-5678'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include('Phone number is invalid')
        end
        it 'user_idがないと登録できない' do
          @order_form.user_id = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idがないと登録できない' do
          @order_form.item_id = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Item can't be blank")
        end

      end
    end
  end
end
