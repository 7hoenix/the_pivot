class PruneUsersModel < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest
    remove_column :users, :display_name
    add_column :users, :nickname, :string
  end
end
