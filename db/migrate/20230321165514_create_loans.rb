class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :user, foreign_key: true
      t.references :software, foreign_key: true
      t.references :tool, foreign_key: true
      t.string :deskripsi
      t.integer :jumlah
      t.date :from_date
      t.date :to_date
      t.string :penanggung_jawab
      t.integer :status

      t.timestamps
    end
  end
end
