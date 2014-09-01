class CreateUserBehaviors < ActiveRecord::Migration
  def change
    create_table :user_behaviors do |t|
      t.integer :user_id
      t.integer :issue_id
      t.integer :noti_id
      t.integer :material_id
      t.integer :impression_id


      t.timestamps
    end
  end
end
