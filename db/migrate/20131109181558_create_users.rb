class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :stuid
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :gender
      t.string :contact
      t.string :department
      t.text :proverb
      t.boolean :admin

      t.timestamps
    end
  end
end
