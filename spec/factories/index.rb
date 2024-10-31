# spec/factories/projects.rb
FactoryBot.define do
  factory :project do
    title { Faker::Company.name }
    description { Faker::Lorem.paragraph }
    application_number { Faker::Number.number(digits: 10) }
    status { [0, 1, 2].sample } # Example: 0 = ongoing, 1 = completed, 2 = on hold
    project_start_date { Faker::Date.backward(days: 30) }
    project_est_end_date { Faker::Date.forward(days: 30) }
  end
end

# spec/factories/phases.rb
FactoryBot.define do
  factory :phase do
    title { ["Initial Review", "Draft Submission", "Client Approval"].sample }
    description { Faker::Lorem.paragraph }
    status { [0, 1, 2].sample } # Example: 0 = pending, 1 = in progress, 2 = completed
    start_date { Faker::Date.backward(days: 30) }
    end_end { Faker::Date.forward(days: 30) }
    client_description { Faker::Lorem.sentence }
    association :project
  end
end

# spec/factories/milestones.rb
FactoryBot.define do
  factory :milestone do
    title { ["Document Collection", "Case Filing", "Hearing Preparation"].sample }
    description { Faker::Lorem.paragraph }
    internal { [true, false].sample }
    client_facing { [true, false].sample }
    completed { [true, false].sample }
    association :phase
  end
end
