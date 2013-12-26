class DelMulti < ActiveRecord::Migration
  def change
    drop_table :multi_societies
  end
end
