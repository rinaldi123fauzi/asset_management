class CreateWorkUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :work_units do |t|
      t.string :nama

      t.timestamps
    end
  end
end
