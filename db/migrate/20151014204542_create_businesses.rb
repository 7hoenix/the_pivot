class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :about
      t.string :slug
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :businesses, :users
  end
end
