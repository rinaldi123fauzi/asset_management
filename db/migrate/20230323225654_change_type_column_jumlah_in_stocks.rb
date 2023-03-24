class ChangeTypeColumnJumlahInStocks < ActiveRecord::Migration[5.2]
  def change
    change_column :stocks, :jumlah, 'integer USING CAST(jumlah AS integer)'
  end
end
