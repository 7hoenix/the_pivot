class ChangeTagTable < ActiveRecord::Migration
  def change
    remove_column :tags, :name
    add_column :tags, :tag_name_id , :integer, :references => "tag_name"
  end
end
