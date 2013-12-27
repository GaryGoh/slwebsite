class AddIssueImageColumn < ActiveRecord::Migration
  def change
    add_column :issue_images, :society_id, :integer
    add_index :issue_images, :society_id, :unique => true
  end
end
