class ChangeDataTrainingStatusToTrainings < ActiveRecord::Migration[5.2]
  def change
    change_column :trainings, :training_status, :integer
  end
end
