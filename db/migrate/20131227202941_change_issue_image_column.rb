class ChangeIssueImageColumn < ActiveRecord::Migration
  def change
    remove_index :issue_images, :society_id
  end
end
