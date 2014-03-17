class Addmorecolumns < ActiveRecord::Migration
  def change
    add_column :notis, :num_attend, :integer
    add_column :notis, :num_maybe, :integer
  end
end
