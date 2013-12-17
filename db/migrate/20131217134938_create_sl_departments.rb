class CreateSlDepartments < ActiveRecord::Migration
  def change
    create_table :sl_departments do |t|
      t.string :sl_dep_name

      t.timestamps
    end
  end
end
