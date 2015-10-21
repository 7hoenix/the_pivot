class CreateRepository < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :full_name
      t.string :name
    end
  end
end
