class AddColumnsIssues < ActiveRecord::Migration
  def change
    add_column :issues, :pic_url, :string
    add_column :issues, :author, :string
  end
end
