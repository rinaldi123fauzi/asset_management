class DeleteColumnInLoans < ActiveRecord::Migration[5.2]
  def change
    remove_column :loans, :software_id
    remove_column :loans, :tool_id
  end
end
