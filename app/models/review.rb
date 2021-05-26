class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :trainer

  validates :title, presence: true
  validates :body, presence: true

end
