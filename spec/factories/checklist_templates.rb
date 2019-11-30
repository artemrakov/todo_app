FactoryBot.define do
  factory :checklist_template do
    title { Faker::ProgrammingLanguage.name }
    association :user

    trait :invalid do
      title { "" }
    end

    trait :build_2_template_items do
      after :create do |checklist_template|
        create_list :template_item, 2, checklist_template: checklist_template
      end
    end
  end
end
