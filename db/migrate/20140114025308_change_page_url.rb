class ChangePageUrl < ActiveRecord::Migration
  def change
    remove_column :page_urls, :subitem_url
    remove_column :page_urls, :subitem
  end
end
