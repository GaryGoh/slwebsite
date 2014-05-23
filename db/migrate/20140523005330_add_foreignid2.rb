class AddForeignid2 < ActiveRecord::Migration
  def change
    add_column :noti_attends, :user_id, :integer
  end
end
