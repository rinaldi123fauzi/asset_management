class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :software, foreign_key: true
      t.references :tool, foreign_key: true
      t.string :jumlah
      t.integer :status

      t.timestamps
    end
  end
end
