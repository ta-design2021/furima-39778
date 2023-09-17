require 'rails_helper'
# Rspecインストール後にrails g modelでモデルを作成すると同時にテストファイルも作成される
RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力項目が、存在すれば登録できる' do
        expect(@item).to be_valid
      end

      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.item_category_id = 1
        expect(@item).to be_valid
      end

      it '商品の状態が「---」以外であれば登録できる' do
        @item.item_sales_status_id = 1
        expect(@item).to be_valid
      end

      it '配送料の負担が「---」以外であれば登録できる' do
        @item.item_shipping_fee_status_id = 1
        expect(@item).to be_valid
      end

      it '発送元の地域が「---」以外であれば登録できる' do
        @item.item_prefecture_id = 1
        expect(@item).to be_valid
      end

      it '発送までの日数が「---」以外であれば登録できる' do
        @item.item_scheduled_delivery_id = 1
        expect(@item).to be_valid
      end

      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.item_price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空欄だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '商品の説明が空欄だと出品できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end

      it '商品の状態の情報が「---」だと出品できない' do
        @item.item_sales_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end

      it '商品の状態の情報が空欄だと出品できない' do
        @item.item_sales_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end

      it '配送料の負担の情報が「---」だと出品できない' do
        @item.item_shipping_fee_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it '配送料の負担の情報が空欄だと出品できない' do
        @item.item_shipping_fee_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it '発送元の地域の情報が「---」だと出品できない' do
        @item.item_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it '発送元の地域の情報が空欄だと出品できない' do
        @item.item_prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end

      it '発送までの日数の情報が「---」だと出品できない' do
        @item.item_scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it '発送までの日数の情報が空欄だと出品できない' do
        @item.item_scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it '価格が空欄だと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it '価格の範囲が、300円未満だと出品できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end

      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
    end
  end
end
