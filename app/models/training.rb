class Training < ApplicationRecord
  validates :training_name, length: { maximum: 50 }

  belongs_to :training_menu, optional: true
  attachment :training_image

  enum training_status: { "未着手": 0, "完了": 1 }
end
