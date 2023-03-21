class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :nama
      t.string :alamat
      t.string :kategori

      t.timestamps
    end
  end
end
