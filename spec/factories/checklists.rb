FactoryBot.define do
  factory :checklist do
    title { "Checklist" }
    association :user
    association :checklist_template
  end
end
