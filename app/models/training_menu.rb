class TrainingMenu < ApplicationRecord
  belongs_to :trainer
  has_many :trainings
  #別のモデルを同じフォームで保存/trainings単体削除
  accepts_nested_attributes_for :trainings, allow_destroy: true
  belongs_to :customer, optional: true

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
