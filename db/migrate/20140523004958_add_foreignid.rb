class AddForeignid < ActiveRecord::Migration
  def change
    add_column :noti_attends, :noti_id, :integer
  end
end
