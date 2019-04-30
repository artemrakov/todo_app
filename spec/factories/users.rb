FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "tester#{n}@test.com" }
    password { 123123 }
  end
end
