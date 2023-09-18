class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # itemsテーブルとのアソシエーション
  has_many :items

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :nickname,        length: { maximum: 40 }
    validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
    validates :last_name,       format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'is invalid. Input full-width characters' }
    validates :first_name,      format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'is invalid. Input full-width characters' }
    validates :last_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
    validates :birth_date
  end

end
