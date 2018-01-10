class AddAssociatedColumnsToResumeEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :resume_entries, :resume_id, :integer
    add_column :resume_entries, :entry_id, :integer
  end
end
