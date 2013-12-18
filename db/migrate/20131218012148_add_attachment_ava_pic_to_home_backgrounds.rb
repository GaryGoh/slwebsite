class AddAttachmentAvaPicToHomeBackgrounds < ActiveRecord::Migration
  def self.up
    change_table :home_backgrounds do |t|
      t.attachment :ava_pic
    end
  end

  def self.down
    drop_attached_file :home_backgrounds, :ava_pic
  end
end
