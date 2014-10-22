class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :sangria_sunday_id
      t.integer :user_id
      t.integer :dish_id
      t.string :is_host
    end
  end
end
