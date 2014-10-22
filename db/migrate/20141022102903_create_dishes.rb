class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :title
      t.string :course
      t.text :recipe
      t.integer :attendance_id
      t.timestamps
    end
  end
end
