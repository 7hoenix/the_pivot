class CreateTagNames < ActiveRecord::Migration
  def change
    create_table :tag_names do |t|
      t.string :name
      t.references :tag, index: true
    end
    add_foreign_key :tag_names, :tags
  end
end
