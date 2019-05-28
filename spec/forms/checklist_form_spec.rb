require 'rails_helper'

RSpec.describe ChecklistForm do
  subject { described_class.new(params) }
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }
  let(:errors) { subject.errors.messages.keys }
  before { subject.validate }

  context 'with valid params' do
    let(:params) do
      {
        user: user,
        checklist_template: checklist_template,
        title: checklist_template.title
      }
    end

    it { expect(errors).not_to include :title }
    it { is_expected.to be_valid }

    it 'creates a checklist from template checklist' do
      expect do
        subject.save
      end.to change(checklist_template.reload.checklists, :count).by(1)
    end

    it 'has same number of items' do
      subject.save
      expect(subject.checklist.items).to eq checklist_template.template_items
    end
  end

  context 'with invalid params' do
    let(:params) { {} }

    it { expect(errors).to include :title }
    it { is_expected.to_not be_valid }

    it 'doesnt create checklist from invalid attributes' do
      expect do
        subject.save
      end.to_not change(checklist_template.reload.checklists, :count)
    end
  end
end
