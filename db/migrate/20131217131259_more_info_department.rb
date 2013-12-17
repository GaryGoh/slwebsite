class MoreInfoDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :num_society, :integer
  end
end
