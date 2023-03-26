class AddColumnKondisiToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :kondisi, :string
  end
end
