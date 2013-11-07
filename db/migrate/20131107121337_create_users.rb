class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :username
      t.string :name
      t.string :gender
      t.string :contact
      t.string :department
      t.text :proverb

      t.timestamps
    end
  end
end
