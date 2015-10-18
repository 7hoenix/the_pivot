class ChangeStatusToString < ActiveRecord::Migration
  def change
    change_column :jobs, :status, :string, default: "active"
  end
end
