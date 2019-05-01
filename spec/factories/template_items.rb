FactoryBot.define do
  factory :template_item do
    title { Faker::ProgrammingLanguage.name }
    description { Faker::ProgrammingLanguage.name }
    association :checklist_template
  end
end
