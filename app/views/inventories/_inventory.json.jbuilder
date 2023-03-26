json.extract! inventory, :id, :kode, :item_id, :merek, :tahun_perolehan, :harga_perolehan, :nilai_residu, :masa_guna, :lama_pakai, :kondisi, :lokasi, :user_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
