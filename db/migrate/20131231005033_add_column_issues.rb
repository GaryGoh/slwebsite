class AddColumnIssues < ActiveRecord::Migration
  def change
    add_column :issues, :location, :string
    add_column :issues, :start_time, :date
    add_column :issues, :end_time, :date
    add_column :issues, :in_members, :integer
    add_column :issues, :is_in, :boolean
  end
end
