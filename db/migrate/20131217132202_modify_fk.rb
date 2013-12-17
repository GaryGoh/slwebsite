class ModifyFk < ActiveRecord::Migration
  def change
    rename_column :users, :department_id, :society_id
  end
end
