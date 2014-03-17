class AddTableToTimetable < ActiveRecord::Migration
  def change
    drop_table :user_notis
  end
end
