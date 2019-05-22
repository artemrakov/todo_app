puts "Creating Users"
3.times do |n|
  User.create!(email: Faker::Internet.email, password: 123123)
end
user_1 = User.last
user_2 = User.second_to_last


puts "Creating ChecklistTemplate"
3.times do |n|
  ChecklistTemplate.create!(title: Faker::Book.title, user: user_1)
end
template_1 = ChecklistTemplate.first
template_2 = ChecklistTemplate.second


puts "Creating TemplateItems"
3.times do |n|
  TemplateItem.create(title: Faker::Movie.quote, checklist_template: template_1)
  TemplateItem.create(title: Faker::Movie.quote, checklist_template: template_1)
  TemplateItem.create(title: Faker::Movie.quote, checklist_template: template_2)
end

puts "Creating checklist with items"
ChecklistForm.new(title: template_1.title, user: user_1, checklist_template: template_1).save
ChecklistForm.new(title: template_1.title, user: user_2, checklist_template: template_1).save
ChecklistForm.new(title: template_2.title, user: user_2, checklist_template: template_2).save

puts "Done!"
