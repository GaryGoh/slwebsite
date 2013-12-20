class AddAttachmentIssuePicToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.attachment :issue_pic
    end
  end

  def self.down
    drop_attached_file :issues, :issue_pic
  end
end
