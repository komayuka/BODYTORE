class Diary < ApplicationRecord
  belongs_to :customer

  validates :title, presence: true
  validates :start_time, presence: true
end
