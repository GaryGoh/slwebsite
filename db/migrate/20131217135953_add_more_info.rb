class AddMoreInfo < ActiveRecord::Migration
  def change
    # add index for fk
    add_index :users, :gender_id
    add_index :admin_users, :gender_id
    add_index :admin_users, :society_id
    add_index :admin_users, :sl_department_id

    # More on admin_users table
    add_column :admin_users, :icon_url, :string
    add_column :admin_users, :proverb, :text
    add_column :admin_users, :contact, :string
    add_column :admin_users, :name, :string
  end
end
