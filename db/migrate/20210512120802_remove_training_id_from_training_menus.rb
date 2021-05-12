class RemoveTrainingIdFromTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :training_menus, :training_id, :integer
  end
end
