class CreateUserSocieties < ActiveRecord::Migration
  def change
    create_table :user_societies do |t|
      t.integer :user_id
      t.integer :society_id

      t.timestamps
    end
  end
end
