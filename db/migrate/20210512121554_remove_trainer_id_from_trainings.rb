class RemoveTrainerIdFromTrainings < ActiveRecord::Migration[5.2]
  def change
    remove_column :trainings, :trainer_id, :integer
  end
end
