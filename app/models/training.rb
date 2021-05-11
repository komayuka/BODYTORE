class Training < ApplicationRecord
  has_many :training_menu
  belongs_to :trainer

  
end
