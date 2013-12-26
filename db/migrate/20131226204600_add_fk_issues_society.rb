class AddFkIssuesSociety < ActiveRecord::Migration
  def change
    add_column :issues, :society_id, :integer
    add_index :issues, :society_id

    # add index to user-societies
    add_index :user_societies, ["user_id", "society_id"], :name => :index_user_societies_on_user_id_and_society_id, :unique => true
    add_index :user_societies, ["society_id"], :name => :user_societies_society_id_fk
  end
end
