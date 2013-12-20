class AddAttachmentAdminPicToAdminUsers < ActiveRecord::Migration
  def self.up
    change_table :admin_users do |t|
      t.attachment :admin_pic
    end
  end

  def self.down
    drop_attached_file :admin_users, :admin_pic
  end
end
