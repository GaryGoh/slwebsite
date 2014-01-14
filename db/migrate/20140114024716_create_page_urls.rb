class CreatePageUrls < ActiveRecord::Migration
  def change
    create_table :page_urls do |t|
      t.string :item
      t.string :subitem
      t.string :item_url
      t.string :subitem_url

      t.timestamps
    end
  end
end
