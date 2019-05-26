class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    due_elements = Checklist.due_date_tomorrow + Item.due_date_tomorrow
    due_elements.each do
      puts 'send email...'
    end
  end
end
