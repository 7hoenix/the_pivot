class RemoveNameFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :name, :string
  end
end
