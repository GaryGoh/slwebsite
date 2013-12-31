class AddColumnNotis < ActiveRecord::Migration
  def change
    add_column :notis, :in_members, :integer
    add_column :notis, :in, :boolean
    add_column :notis, :location, :string

  end
end
