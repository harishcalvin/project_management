class Milestone < ApplicationRecord
  belongs_to :phase

  before_save :set_default_values

  private

  def set_default_values
    self.internal = true if internal.nil?
    self.client_facing = false if client_facing.nil? && internal
    self.client_facing = true if client_facing.nil? && !internal
  end
end
