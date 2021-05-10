class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :training_menu_id, null: false
      t.integer :trainer_id,       null: false
      t.text :training_description
      t.string :training_name,     null: false
      t.boolean :training_status, default: false, null: false
      t.string :training_image_id

      t.timestamps
    end
  end
end
