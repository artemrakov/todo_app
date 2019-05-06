FactoryBot.define do
  factory :item do
    title { Faker::ProgrammingLanguage.name }
    state { "not_done" }
    association :checklist
    association :template_item

    trait :complete do
      state { "done" }
    end

    trait :invalid do
      title { "" }
    end
  end
end
