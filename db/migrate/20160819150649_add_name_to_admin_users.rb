class AddNameToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :name, :string
    add_index :admin_users, :name, unique: true
  end
end
