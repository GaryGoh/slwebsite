class CreateSubFaqs < ActiveRecord::Migration
  def change
    create_table :sub_faqs do |t|
      t.string :query
      t.string :answer
      t.integer :faq_id

      t.timestamps
    end
  end
end
