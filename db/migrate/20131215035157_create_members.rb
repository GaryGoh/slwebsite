class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :memid

      t.timestamps
    end
  end
end
