FactoryBot.define do
  factory :item do
    title { Faker::ProgrammingLanguage.name }
    done { false }
    association :checklist
    association :template_item

    trait :complete do
      done { true }
    end

    trait :invalid do
      title { "" }
    end
  end
end
