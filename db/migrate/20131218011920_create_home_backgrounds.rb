class CreateHomeBackgrounds < ActiveRecord::Migration
  def change
    create_table :home_backgrounds do |t|
      t.string :description

      t.timestamps
    end
  end
end
