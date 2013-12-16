class RefineUsers < ActiveRecord::Migration
  def change
    add_column :users, :member_id, :integer
    add_column :users, :is_active, :boolean, :default => true, :null => false
    add_index :users, :member_id
  end
end
