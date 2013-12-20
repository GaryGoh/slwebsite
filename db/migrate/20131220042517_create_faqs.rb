class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :query
      t.text :answer

      t.timestamps
    end
  end
end
