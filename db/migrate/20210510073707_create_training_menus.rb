class CreateTrainingMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :training_menus do |t|
      t.integer :training_id,          null: false
      t.integer :trainer_id,           null: false
      t.integer :customer_id,          null: false
      t.string :training_name,         null: false
      t.integer :category,             null: false
      t.text :description
      t.integer :training_menu_status, null: false

      t.timestamps
    end
  end
end
