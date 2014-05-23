class AddCounter < ActiveRecord::Migration
  def change
    add_column :issues, :issue_catch_counter, :integer
    add_column :notis, :noti_catch_counter, :integer

  end
end
