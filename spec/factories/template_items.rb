FactoryBot.define do
  factory :template_item do
    title { Faker::ProgrammingLanguage.name }
    association :checklist_template

    trait :invalid do
      title { "" }
    end
  end
end
