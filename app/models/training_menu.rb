class TrainingMenu < ApplicationRecord
  belongs_to :trainer
  belongs_to :training
  belongs_to :customer

  enum category: {
    "ヨガ": 0,
    "腹筋": 1,
    "腕": 2,
    "胸": 3,
    "お尻": 4,
    "下半身": 5
  }

  enum training_status: {
    "未対応": 0,
    "スタート": 1,
    "complete": 2,
  }
end
