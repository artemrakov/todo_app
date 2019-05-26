FactoryBot.define do
  factory :item do
    title { Faker::ProgrammingLanguage.name }
    state { "not_done" }
    type { "" }
    association :checklist

    trait :inherited do
      association :template_item
    end

    trait :complete do
      state { "done" }
    end

    trait :invalid do
      title { "" }
    end
  end
end
