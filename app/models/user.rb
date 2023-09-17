class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # itemsテーブルとのアソシエーション
  has_many :items

  # バリデーションの設定
  validates :nickname,           presence: true, length: { maximum: 40 }
  validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  validates :last_name,          presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'is invalid. Input full-width characters' }
  validates :first_name,         presence: true, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'is invalid. Input full-width characters' }
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birth_date,         presence: true

end
