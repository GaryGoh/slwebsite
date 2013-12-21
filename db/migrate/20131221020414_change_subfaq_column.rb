class ChangeSubfaqColumn < ActiveRecord::Migration
  def change
    change_column :sub_faqs, :answer, :text
  end
end
