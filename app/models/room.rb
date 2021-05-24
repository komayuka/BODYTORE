class Room < ApplicationRecord
  belongs_to :customer
  belongs_to :trainer
  has_many :messages, dependent: :destroy
end
