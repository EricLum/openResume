class Resume < ApplicationRecord
  has_many :entries, through: :resume_entries
  has_many :resume_entries
  belongs_to :user
end
