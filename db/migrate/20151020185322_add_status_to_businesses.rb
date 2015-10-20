class AddStatusToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :status, :string, default: "online"
  end
end
