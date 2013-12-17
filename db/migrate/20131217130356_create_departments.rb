class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :dep_name

      t.timestamps
    end
  end
end
