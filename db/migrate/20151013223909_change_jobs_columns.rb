class ChangeJobsColumns < ActiveRecord::Migration
  def change
    rename_column :jobs, :price, :business_id
    add_column :jobs, :benefits, :string
    add_column :jobs, :address_id, :integer
    remove_column :jobs, :picture_file_name
    remove_column :jobs, :picture_content_type
    remove_column :jobs, :picture_file_size
    remove_column :jobs, :picture_updated_at
  end
end
