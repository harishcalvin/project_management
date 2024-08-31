# app/models/phase.rb
class Phase < ApplicationRecord
  belongs_to :project
  has_many :milestones, dependent: :destroy
  accepts_nested_attributes_for :milestones, allow_destroy: true, reject_if: :all_blank

  # Define enum for statuses
  enum status: {pending: 0, in_progress: 1, completed: 2}

  validates :client_description, presence: true
  # Other model code...
end
