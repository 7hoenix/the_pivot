class CreateResumeRepositories < ActiveRecord::Migration
  def change
    create_table :resume_repositories do |t|
      t.integer :resume_id
      t.integer :repository_id
    end
  end
end
