class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.integer :user_id
      t.integer :resume_id
      t.integer :job_id
    end
  end
end
