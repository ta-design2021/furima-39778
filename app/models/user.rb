class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # itemsテーブルとのアソシエーション
  has_many :items
  # ordersテーブルとのアソシエーション
  has_many :orders

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :nickname,        length: { maximum: 40 }
    validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は無効です。半角英数字で入力してください' }
    validates :last_name,       format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'は無効です。全角文字で入力してください' }
    validates :first_name,      format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'は無効です。全角文字で入力してください' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'は無効です。全角カナ文字で入力してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は無効です。全角カナ文字で入力してください' }
    validates :birth_date
  end

end
