class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_day, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/} do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]\z/} do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
end
