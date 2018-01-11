class Entry < ApplicationRecord
  has_many :resume_entries
  has_many :resumes, through: :resume_entries
end
