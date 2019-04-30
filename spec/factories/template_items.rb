FactoryBot.define do
  factory :template_item do
    title { "Template Item" }
    association :template_checklist
  end
end
