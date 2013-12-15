class AddCategoriesInIssues < ActiveRecord::Migration
  def change
    add_column :issues, :category_id, :integer
    add_index :issues, :category_id
  end
end
