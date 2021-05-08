class ChangeColumbToNull < ActiveRecord::Migration[5.2]
  def up
    # Not Null外す
    change_column_null :customers, :customer_image_id, true
    change_column_null :customers, :body_weight, true
    change_column_null :customers, :height, true
    change_column_null :customers, :customer_introduction, true
    change_column_null :trainers, :trainer_introduction, true
    change_column_null :trainers, :rate, true
    change_column_null :trainers, :trainer_image_id, true
  end

  def down
    change_column_null :customers, :customer_image_id, false
    change_column_null :customers, :body_weight, false
    change_column_null :customers, :height, false
    change_column_null :customers, :customer_introduction, false
    change_column_null :trainers, :trainer_introduction, false
    change_column_null :trainers, :rate, false
    change_column_null :trainers, :trainer_image_id, false
  end
end
