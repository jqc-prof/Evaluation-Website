class RemoveAdminFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin, :boolean
    remove_column :users, :is_admin, :boolean
    remove_column :users, :role, :string
  end
end
