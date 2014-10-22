class CreateSangriaSundays < ActiveRecord::Migration
  def change
    create_table :sangria_sundays do |t|
      t.string :location
      t.date :date
    end
  end
end
