class RenameTable < ActiveRecord::Migration
  def change
    rename_column :page_urls, :item, :item_name
    rename_table :page_urls, :item
  end
end
