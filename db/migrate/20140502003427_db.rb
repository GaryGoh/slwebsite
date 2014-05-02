class Db < ActiveRecord::Migration
  def change
    create_table :messaegs do |t|
      t.string :user_id
      t.string :msg_content
      t.string :msg_font
      t.string :msg_position

      t.timestamps
    end
  end
end


