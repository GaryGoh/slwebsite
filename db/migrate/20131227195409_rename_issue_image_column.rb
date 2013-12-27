class RenameIssueImageColumn < ActiveRecord::Migration
  def change
    rename_column :issue_images, :descrition, :description
  end
end
