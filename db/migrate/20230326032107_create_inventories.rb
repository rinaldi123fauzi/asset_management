class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :kode
      t.references :item, foreign_key: true
      t.string :merek
      t.date :tahun_perolehan
      t.integer :harga_perolehan
      t.integer :nilai_residu
      t.date :masa_guna
      t.string :lama_pakai
      t.string :kondisi
      t.string :lokasi
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
