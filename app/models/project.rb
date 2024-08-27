# app/models/project.rb
class Project < ApplicationRecord
  has_many :phases, dependent: :destroy
  # Define enum for statuses
  enum status: {pending: 0, in_progress: 1, completed: 2}
end
