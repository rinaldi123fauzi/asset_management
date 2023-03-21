class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.references :loan, foreign_key: true
      t.string :approve_by
      t.integer :approve_level
      t.datetime :date

      t.timestamps
    end
  end
end
