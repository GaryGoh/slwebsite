class ChageType < ActiveRecord::Migration
  def change
    change_column :notis, :start_time, :datetime
    change_column :notis, :end_time, :datetime

  end
end
