class CreateSoftwares < ActiveRecord::Migration[5.2]
  def change
    create_table :softwares do |t|
      t.string :nomor_serial
      t.string :nama
      t.string :kategori
      t.string :license_by
      t.string :expired_date
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
