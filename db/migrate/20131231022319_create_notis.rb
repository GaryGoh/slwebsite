class CreateNotis < ActiveRecord::Migration
  def change
    create_table :notis do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.integer :society_id
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
