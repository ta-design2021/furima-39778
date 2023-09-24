class OrderAddress
  include ActiveModel::Model
  # ordesテーブルとaddressesテーブルに保存したいカラム名をすべて指定
  attr_accessor :user_id, :item_id, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id # order_addressクラスにはアソシエーションを定義することはできない、belongs_toによるバリデーションを行うことができないのでorder_addressクラスでuser_idとitem_idに対してバリデーションを新たに設定。
    validates :item_id
    # addressesモデルのバリデーション
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :item_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input only number' }
    validates_length_of :phone_number, maximum: 11, message: 'is too long'
    validates_length_of :phone_number, minimum: 10, message: 'is too short'
    validates :token
  end

  # フォームから送られてきた情報をテーブルに保存する処理
  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order_id: order.id)
  end
end
