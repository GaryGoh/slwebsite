class DelUserSocietyId < ActiveRecord::Migration
  def change
    remove_column :users, :society_id
    remove_column :societies, :user_id
  end
end
