class ResumeEntry < ApplicationRecord
  belongs_to :resume
  belongs_to :entry
  accepts_nested_attributes_for :entry
  accepts_nested_attributes_for :resume
end
