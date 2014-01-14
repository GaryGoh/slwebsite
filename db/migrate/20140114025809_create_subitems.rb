class CreateSubitems < ActiveRecord::Migration
  def change
    create_table :subitems do |t|
      t.string :subitem_name
      t.string :subitem_url
      t.integer :item_id

      t.timestamps
    end
  end
end
