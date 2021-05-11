class Customer < ApplicationRecord
  has_many :training_menu

  validates :customer_name, uniqueness: true, length: { in: 2..20 }
  validates :customer_introduction, length: { maximum: 50 }
  validates :age, numericality: true

  attachment :customer_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :customer_image

  enum gender: {
    "男性": 0,
    "女性": 1,
  }

end
