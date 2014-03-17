class CreateNotiAttends < ActiveRecord::Migration
  def change
    create_table :noti_attends do |t|
      t.string :username
      t.string :email
      t.integer :stuid

      t.timestamps
    end
  end
end
