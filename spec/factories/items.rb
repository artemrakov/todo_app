FactoryBot.define do
  factory :item do
    title { "Item" }
    done { false }
    association :checklist
    association :template_item

    trait :complete do
      done { true }
    end
  end
end
