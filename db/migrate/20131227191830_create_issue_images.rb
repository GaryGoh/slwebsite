class CreateIssueImages < ActiveRecord::Migration
  def change
    create_table :issue_images do |t|
      t.integer :issue_id
      t.string :descrition

      t.timestamps
    end
  end
end
