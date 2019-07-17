require 'rails_helper'

RSpec.describe ChecklistCreationService do
  subject { described_class.new(checklist_form, user) }
  let(:user) { create(:user) }
  let(:checklist_form) { { title: 'hello', visibility: 'everyone' } }

  it 'creates a checklist' do
    expect do
      subject.run
    end.to change(Checklist, :count).by(1)
  end

  it 'creates checklist template' do
    expect do
      subject.run
    end.to change(ChecklistTemplate, :count).by(1)
  end
end
