# app/models/phase.rb
class Phase < ApplicationRecord
  belongs_to :project

  # Define enum for statuses
  enum status: {pending: 0, in_progress: 1, completed: 2}

  # Other model code...
end
