class AddMemberidUsers < ActiveRecord::Migration
  def change
    add_column :users, :members_id, :integer
    add_index :users, :members_id
  end
end
