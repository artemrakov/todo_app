FactoryBot.define do
  factory :checklist do
    title { Faker::ProgrammingLanguage.name }
    association :user
    association :checklist_template
  end
end
