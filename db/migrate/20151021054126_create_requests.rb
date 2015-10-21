class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :resumer_id
      t.integer :job_id
    end
  end
end
