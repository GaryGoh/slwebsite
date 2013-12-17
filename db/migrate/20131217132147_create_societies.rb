class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :society_name
      t.integer :department_id
      t.integer :num_member
      t.integer :num_registered_member
      t.string :home_url
      t.boolean :is_outstanding

      t.timestamps
    end
  end
end
