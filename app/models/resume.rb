class Resume < ApplicationRecord
  has_many :resume_entries
  has_many :entries, through: :resume_entries
  belongs_to :user
  accepts_nested_attributes_for :entries
end
