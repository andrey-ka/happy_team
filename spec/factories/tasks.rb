FactoryBot.define do
  factory :task do
    title { 'Investigation' }
    owner_id { UUID.generate }
    project_id { UUID.generate }

    trait :with_project do
      project
    end
  end
end
