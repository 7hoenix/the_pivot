class CreateWatchedJobs < ActiveRecord::Migration
  def change
    create_table :watched_jobs do |t|
      t.references :user, index: true
      t.references :job, index: true

      t.timestamps null: false
    end
    add_foreign_key :watched_jobs, :users
    add_foreign_key :watched_jobs, :jobs
  end
end
