FactoryBot.define do
  factory :checklist_template do
    title { Faker::ProgrammingLanguage.name }

    trait :invalid do
      title { "" }
    end
  end
end
