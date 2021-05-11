class Trainer < ApplicationRecord
  has_many :training
  has_many :training_menu


  validates :trainer_name, uniqueness: true, length: { in: 2..20 }
  validates :trainer_introduction, length: { maximum: 50 }

  attachment :trainer_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum gender: {
    "男性": 0,
    "女性": 0,
  }

end
