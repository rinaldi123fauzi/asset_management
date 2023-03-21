class CreateTools < ActiveRecord::Migration[5.2]
  def change
    create_table :tools do |t|
      t.string :nomor_serial
      t.string :nama
      t.string :kategori
      t.string :sifat
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
