class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    ElementsDueQuery.call.each do
      puts 'send email...'
    end
  end
end
