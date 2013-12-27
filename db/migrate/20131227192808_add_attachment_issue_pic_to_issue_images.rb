class AddAttachmentIssuePicToIssueImages < ActiveRecord::Migration
  def self.up
    change_table :issue_images do |t|
      t.attachment :issue_pic
    end
  end

  def self.down
    drop_attached_file :issue_images, :issue_pic
  end
end
