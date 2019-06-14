require 'rails_helper'
require 'benchmark'

describe ChecklistsController, type: :controller do
  it 'is fast' do
    user = create(:user)
    (0..200).map { create(:checklist, user: user) }
    user.save!
    allow(controller).to receive(:current_user).and_return(user)
    benchmark do
      get :index
    end
  end
end

def benchmark
  yield
  # In real example you might want to run this many times, add mean and variance
  time = Benchmark.realtime { yield }
  puts "RUNTIME: #{time}"
end