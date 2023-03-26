class DeleteTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :stocks
    drop_table :softwares
    drop_table :tools
    drop_table :vendors
  end
end
