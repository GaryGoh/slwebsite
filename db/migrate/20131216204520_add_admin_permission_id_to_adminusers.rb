class AddAdminPermissionIdToAdminusers < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin_permission_id, :integer
    add_index :admin_users, :admin_permission_id
  end
end
