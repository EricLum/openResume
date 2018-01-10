class AddTitleToResumes < ActiveRecord::Migration[5.1]
  def change
    add_column :resumes, :title, :string
  end
end
