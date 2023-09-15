class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  #空の投稿を保存できないようにする
  # validates :title, :text, presence: true

  #ジャンルの選択が「---」の時は保存できないようにする
  # item_category_idのid:1以外のときに保存できるという意味です
  validates :item_category_id, numericality: { other_than: 1, message: "Item category can't be blank"}
  validates :item_sales_status_id, numericality: { other_than: 1, message: "Item sales status can't be blank"}
  validates :item_shipping_fee_status_id, numericality: { other_than: 1, message: "Item hipping fee status can't be blank"}
  validates :item_prefecture_id, numericality: { other_than: 1, message: "Item prefecture can't be blank"}
  validates :item_scheduled_delivery_id, numericality: { other_than: 1, message: "Item scheduled delivery can't be blank"}

end
