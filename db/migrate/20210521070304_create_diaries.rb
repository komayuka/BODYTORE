class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :title
      t.text :content
      t.float :weight
      t.date :start_time
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
