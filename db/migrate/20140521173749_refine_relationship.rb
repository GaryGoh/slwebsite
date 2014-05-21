class RefineRelationship < ActiveRecord::Migration
  def change
    add_column :timetables, :noti_id, :integer

  end
end
