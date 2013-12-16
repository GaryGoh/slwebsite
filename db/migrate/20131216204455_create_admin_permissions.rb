class CreateAdminPermissions < ActiveRecord::Migration
  def change
    create_table :admin_permissions do |t|
      t.string :permission_name

      t.timestamps
    end
  end
end
