class Training < ApplicationRecord
  belongs_to :training_menu


  enum training_status: {"未着手": 0,"完了": 1}

end
