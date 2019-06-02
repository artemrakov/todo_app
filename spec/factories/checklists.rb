FactoryBot.define do
  factory :checklist do
    title { Faker::ProgrammingLanguage.name }
    association :user
    association :checklist_template

    trait :invalid do
      title { "" }
    end

    trait :due_tomorrow do
      due_date { Date.tomorrow.in_time_zone }
    end

    trait :due_today do
      due_date { Date.today.in_time_zone }
    end
  end
end
