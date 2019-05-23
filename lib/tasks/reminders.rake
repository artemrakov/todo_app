namespace :reminders do
  desc "Send reminders to user that checklist or items are due"
  task all: :environment do
    due_elements = Checklist.due_date_tomorrow + Item.due_date_tomorrow
    due_elements.each do
      puts 'send email...'
    end
  end
end
