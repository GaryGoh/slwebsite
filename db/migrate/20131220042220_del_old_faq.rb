class DelOldFaq < ActiveRecord::Migration
  def change
    drop_table :faqs
  end
end
