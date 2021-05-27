class TrainingMenu < ApplicationRecord
  validates :training_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true

  belongs_to :trainer
  has_many :trainings, dependent: :destroy
  # 別のモデルを同じフォームで保存/trainings単体削除
  accepts_nested_attributes_for :trainings, allow_destroy: true
  # optional=>nilでも可
  belongs_to :customer, optional: true
  accepts_attachments_for :trainings, attachment: :training_image

  enum category: {
    "ヨガ": 0,
    "筋トレ": 1,
    "有酸素": 2,
    "ストレッチ": 3
  }

  enum training_status: {
    "未対応": 0,
    "スタート": 1,
    "complete": 2
  }
end
