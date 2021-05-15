class Trainer < ApplicationRecord
  validates :trainer_name, uniqueness: true, length: { in: 2..20 }
  validates :trainer_introduction, length: { maximum: 50 }


  has_many :training
  has_many :training_menu
  has_many :favorites, dependent: :destroy


  attachment :trainer_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum gender: {
    "男性": 0,
    "女性": 0,
  }

  def favorites_by?(customer)
    favorites.where(customer_id: cistomer.id).exists?
  end

end
