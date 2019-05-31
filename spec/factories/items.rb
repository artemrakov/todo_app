FactoryBot.define do
  factory :item do
    title { Faker::ProgrammingLanguage.name }
    state { "not_done" }
    type { "" }
    association :checklist

    trait :inherited do
      type { "InheritedItem" }
      association :template_item
    end

    trait :custom do
      type { "CustomItem" }
    end

    trait :complete do
      state { "done" }
    end

    trait :invalid do
      title { "" }
    end

    trait :due_today do
      due_date { Date.today.in_time_zone }
    end

    trait :due_tomorrow do
      due_date { Date.tomorrow.in_time_zone }
    end
  end
end
