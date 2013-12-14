class DelColumnsIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :date
  end
end
