class DelColumnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :department
  end
end
