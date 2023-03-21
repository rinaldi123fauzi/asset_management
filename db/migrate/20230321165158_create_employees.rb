class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :id_pegawai
      t.string :nama
      t.string :tempat_lahir
      t.date :tanggal_lahir
      t.string :alamat
      t.string :id_identitas
      t.string :nomor_telepon
      t.string :email
      t.string :jabatan
      t.references :work_unit, foreign_key: true

      t.timestamps
    end
  end
end
