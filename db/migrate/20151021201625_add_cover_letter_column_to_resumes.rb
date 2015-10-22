class AddCoverLetterColumnToResumes < ActiveRecord::Migration
  def change
    add_attachment :resumes, :cover_letter
  end
end
