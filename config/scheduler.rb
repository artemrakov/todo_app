require 'clockwork'
require_relative '../config/boot'
require_relative '../config/environment'

module Clockwork
  every(10.seconds, 'SendReminderJob') do
    ReminderJob.perform_later
  end
end
