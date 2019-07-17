require 'rails_helper'

RSpec.describe ChecklistCopiesService do
  subject { described_class.new(user, checklist_template) }
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template, :build_2_template_items) }

  it 'creates a checklist' do
    expect do
      subject.run
    end.to change(Checklist, :count).by(1)
  end

  it 'creates same number of items' do
    subject.run
    expect(checklist_template.template_items.size).to eq subject.checklist.items.size
  end
end
