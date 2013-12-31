class MoreNots < ActiveRecord::Migration
  def change
    remove_column :issues, :location, :string
    remove_column :issues, :start_time, :date
    remove_column :issues, :end_time, :date
    remove_column :issues, :in_members, :integer
    remove_column :issues, :is_in, :boolean
  end
end
