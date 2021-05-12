class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :training_menus, :trainer_id, true
    change_column_null :training_menus, :customer_id, true
    change_column_null :trainings, :training_menu_id, true
  end

  def down
    change_column_null :training_menus, :trainer_id, false
    change_column_null :training_menus, :customer_id, false
    change_column_null :trainings, :training_menu_id, false
  end
end
