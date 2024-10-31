require "factory_bot_rails"
include FactoryBot::Syntax::Methods

# Clear existing data
Milestone.destroy_all
Phase.destroy_all
Project.destroy_all

# Create projects, phases, and milestones
100.times do
  project = create(:project)

  # Random number of phases between 2 and 14
  rand(2..14).times do
    phase = create(:phase, project: project)

    # Random number of milestones between 2 and 14 for each phase
    rand(2..14).times do
      create(:milestone, phase: phase)
    end
  end
end

puts "Seeded 5 projects with phases and milestones."
