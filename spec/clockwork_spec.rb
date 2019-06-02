require "clockwork/test"

describe Clockwork do
  after(:each) { Clockwork::Test.clear! }

  it "runs the job once" do
    Clockwork::Test.run(max_ticks: 1, file: './config/scheduler.rb')

    expect(Clockwork::Test.ran_job?("SendReminderJob")).to be_truthy
    expect(Clockwork::Test.times_run("SendReminderJob")).to eq 1
  end

  it "runs the job every day over the course of 2 days" do
    start_time = Time.new(2018, 11, 22, 2, 0, 0)
    end_time = Time.new(2018, 11, 24, 2, 0, 0)

    Clockwork::Test.run(
      start_time: start_time,
      end_time: end_time,
      tick_speed: 1.day,
      file: './config/scheduler.rb'
    )

    expect(Clockwork::Test.times_run("SendReminderJob")).to eq 2
  end
end
