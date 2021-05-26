class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :customer_id
      t.integer :trainer_id

      t.timestamps
    end
  end
end
