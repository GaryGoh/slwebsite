class AddFkUsersUserSocieties < ActiveRecord::Migration
  def change
    add_column :users, :user_society_id, :integer
    add_index :users, :user_society_id
  end
end
