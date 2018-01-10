class AddDetailToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :job_title, :string
    add_column :entries, :start_date, :date
    add_column :entries, :end_date, :date
    add_column :entries, :description, :text
  end
end
