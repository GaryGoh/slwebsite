class Droptable < ActiveRecord::Migration
  def change
    drop_table :noti_attends
  end
end
