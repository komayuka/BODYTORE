class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :trainer

  validates_uniqueness_of :trainer_id, scope: :customer_id
end
