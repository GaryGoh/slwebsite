class AddAttachmentDocumentToMaterials < ActiveRecord::Migration
  def self.up
    change_table :materials do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :materials, :document
  end
end
