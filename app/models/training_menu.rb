class TrainingMenu < ApplicationRecord
  belongs_to :trainer
  belongs_to :training
  belongs_to :customer
end
