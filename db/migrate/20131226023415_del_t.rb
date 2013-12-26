class DelT < ActiveRecord::Migration
  def change
    drop_table :users_societies
  end
end
