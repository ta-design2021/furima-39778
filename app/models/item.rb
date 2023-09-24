class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # usersテーブルとのアソシエーション
  belongs_to :user
  # ordersテーブルとのアソシエーション
  has_one :order

  # active_storageとのアソシエーション
  # items・active_storage_blobsテーブルを関連付け
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_info,                  length: { maximum: 1000 }
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
    # 販売価格は半角数字でないと入力不可
    validates :item_price,                 numericality: { only_integer: true, message: 'is invalid. Input half-width characters'}

    # 300円以上かつ9,999,999円以下でないと入力不可
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is out of setting range'}

  end

  #ジャンルの選択が「---」の時は保存できないようにする
  # id:1以外のときに保存できるという意味です
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :item_category_id
    validates :item_sales_status_id
    validates :item_shipping_fee_status_id
    validates :item_prefecture_id
    validates :item_scheduled_delivery_id
  end

end
