require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

      context '配送先情報の保存ができるとき' do
        it 'postal_code、item_prefecture_id、city、addresses、building、phone_numberの値が正しく入力されて入れいれば登録できる' do
          expect(@order_address).to be_valid
        end

        it 'user_idが空でなければ保存できる' do
          @order_address.user_id = 1
          expect(@order_address).to be_valid
        end

        it 'item_idが空でなければ保存できる' do
          @order_address.item_id = 1
          expect(@order_address).to be_valid
        end

        it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
          @order_address.postal_code = '123-4567'
          expect(@order_address).to be_valid
        end

        it '都道府県が「---」以外かつ空でなければ保存できる' do
          @order_address.item_prefecture_id = 2
          expect(@order_address).to be_valid
        end

        it '市区町村が空でなければ保存できる' do
          @order_address.city = '八王子市'
          expect(@order_address).to be_valid
        end

        it '番地が空でなければ保存できる' do
          @order_address.addresses = '１番地１２３'
          expect(@order_address).to be_valid
        end

        it '建物名が空でも保存できる' do
          @order_address.building = nil
          expect(@order_address).to be_valid
        end

        it '電話番号が11桁以内かつハイフンなしであれば保存できる' do
          @order_address.phone_number = 12_345_678_910
          expect(@order_address).to be_valid
        end

        it "tokenがあれば保存ができること" do
          expect(@order_address).to be_valid
        end

      end

      context '配送先情報の保存ができないとき' do
        it 'user_idが空だと保存できない' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空だと保存できない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end

        it '郵便番号が空だと保存できないこと' do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it '郵便番号にハイフンがないと保存できないこと' do
          @order_address.postal_code = 1_234_567
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code は無効です。ハイフンを含めて入力してください')
        end

        it '都道府県が「---」だと保存できないこと' do
          @order_address.item_prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item prefecture を選択してください")
        end

        it '都道府県が空だと保存できないこと' do
          @order_address.item_prefecture_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item prefecture can't be blank")
        end

        it '市区町村が空だと保存できないこと' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it '番地が空だと保存できないこと' do
          @order_address.addresses = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
        end

        it '電話番号が空だと保存できないこと' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it '電話番号が10桁以下であると保存できないこと' do
          @order_address.phone_number = '123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number が短すぎます')
        end

        it '電話番号が12桁以上でないと保存できないこと' do
          @order_address.phone_number = '123456789012'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number が長すぎます')
        end

        it '電話番号にハイフンがあると保存できないこと' do
          @order_address.phone_number = '123 - 4567 - 8901'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number は無効です。数字のみを入力してください')
        end

        it "tokenが空では登録できないこと" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
