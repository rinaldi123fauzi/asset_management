class AddNameAndUsernameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :state, :boolean, default: true
    add_column :users, :user_type, :string
  end
end
