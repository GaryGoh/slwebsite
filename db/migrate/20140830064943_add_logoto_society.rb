class AddLogotoSociety < ActiveRecord::Migration
  def change
      add_attachment :societies, :logo
  end
end
