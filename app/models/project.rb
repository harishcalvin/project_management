# app/models/project.rb
class Project < ApplicationRecord
  has_many :phases, dependent: :destroy
  # Define enum for statuses
  enum status: {pending: 0, in_progress: 1, completed: 2}
  validates :project_start_date, presence: true, on: :update
  validates :project_est_end_date, presence: true, on: :update
  validate :est_end_date_after_start_date, if: -> { project_start_date.present? && project_est_end_date.present? }

  private

  def est_end_date_after_start_date
    if project_est_end_date < project_start_date
      errors.add(:project_est_end_date, "must be after the start date")
    end
  end
end
