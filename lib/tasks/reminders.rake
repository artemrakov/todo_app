namespace :reminders do
  desc "Send reminders to user that checklist or items are due"
  task all: :environment do
    ReminderJob.perform_now
  end
end
