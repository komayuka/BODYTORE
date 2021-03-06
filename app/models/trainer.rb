class Trainer < ApplicationRecord
  validates :trainer_name, presence: true, length: { in: 2..20 }
  validates :trainer_introduction, length: { maximum: 50 }

  has_many :trainings, dependent: :destroy
  has_many :training_menus, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  attachment :trainer_image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: {
    "男性": 0,
    "女性": 1
  }

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
