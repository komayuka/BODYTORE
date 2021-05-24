class Customer < ApplicationRecord
  validates :customer_name, uniqueness: true, length: { in: 2..20 }
  validates :customer_introduction, length: { maximum: 50 }
  validates :age, numericality: true
  validates :body_weight, numericality: true, allow_blank: true
  validates :height, numericality: true, allow_blank: true

  has_many :training_menus
  has_many :trainings, through: :training_menu
  has_many :favorites, dependent: :destroy
  has_many :favorited_trainers, through: :favorites, source: :trainer
  has_many :diaries
  has_many :messages, dependent: :destroy

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

def bmi(body_weight,height)
  (body_weight / (height*0.1) ** 2 * 100).round(1)
end



end
