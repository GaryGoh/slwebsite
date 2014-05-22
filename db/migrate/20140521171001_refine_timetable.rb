class RefineTimetable < ActiveRecord::Migration
  def change
    add_column :timetables, :noti_name, :string
    add_column :timetables, :noti_location, :string
    add_column :timetables, :remind, :boolean

    add_column :noti_attends, :stu_society, :string
    add_column :noti_attends, :stu_contact, :string


  end
end
