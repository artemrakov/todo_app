require 'rails_helper'

RSpec.describe ReminderJob, type: :job do
  include ActiveJob::TestHelper
  let(:element_due_query) { class_double('ElementsDueQuery').as_stubbed_const }
  subject(:job) { described_class.perform_later }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .on_queue('default')
  end

  it 'executes perform' do
    allow(element_due_query).to receive(:call).and_return([])
    expect(element_due_query).to receive(:call)
    perform_enqueued_jobs { job }
  end
end
