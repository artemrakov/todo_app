FactoryBot.define do
  factory :template_item do
    title { Faker::ProgrammingLanguage.name }
    association :template_checklist
  end
end
