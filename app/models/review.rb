class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :trainer

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 50 }
end
