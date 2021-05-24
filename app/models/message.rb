class Message < ApplicationRecord
  belongs_to :room
  belongs_to :customer, optional: true
  belongs_to :trainer, optional: true

  validates :message, presence: true
end
