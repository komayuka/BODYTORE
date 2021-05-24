class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :trainer, foreign_key: true
      t.text :message, null: false

      t.timestamps
    end
  end
end
