class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :user_id
      t.string :start_time
      t.string :end_time
      t.string :title
      t.string :content
      t.string :location

      t.timestamps
    end
  end
end
