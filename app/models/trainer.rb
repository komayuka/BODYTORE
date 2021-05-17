class Trainer < ApplicationRecord
  validates :trainer_name, uniqueness: true, length: { in: 2..20 }
  validates :trainer_introduction, length: { maximum: 50 }


  has_many :trainings
  has_many :training_menus
  has_many :favorites, dependent: :destroy
  has_many :favorited_customer, through: :favorites, source: :customer

  attachment :trainer_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum gender: {
    "男性": 0,
    "女性": 1,
  }

  def favorited_by?(current_customer)
    favorites.where(current_customer).exists?
  end

end
