class SoeictyDatabas < ActiveRecord::Migration
  def change
    add_column :societies, :history, :string
    add_column :societies, :profile, :string
    add_column :societies, :president, :string

  end
end
