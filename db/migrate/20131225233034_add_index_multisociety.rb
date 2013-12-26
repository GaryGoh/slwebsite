class AddIndexMultisociety < ActiveRecord::Migration
  def change
    add_index :multi_societies, ['user_id', 'society_id'], :unique => true
  end
end
