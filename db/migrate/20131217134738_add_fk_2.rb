class AddFk2 < ActiveRecord::Migration
  def change
    add_column :users, :gender_id, :integer
    add_column :admin_users, :gender_id, :integer
    add_column :admin_users, :society_id, :integer
    add_column :admin_users, :sl_department_id, :integer

  end
end
