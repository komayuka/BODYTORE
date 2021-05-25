class ChangeCategoryOfTrainingMenus < ActiveRecord::Migration[5.2]
  def up
    change_column :training_menus, :category, :integer, default: 0, null: false
  end

  def down
    change_column :training_menus, :category, :integer, null: false
  end

end
