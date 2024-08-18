class Project < ApplicationRecord
    has_many :phases, dependent: :destroy
end
