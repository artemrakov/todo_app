require 'rails_helper'

RSpec.describe ChecklistCreationService do
  subject { described_class.new(params, user) }
  let(:user) { create(:user) }
  let(:errors) { subject.errors.messages.keys }
  before { subject.validate }

  context 'valid params' do
    let(:params) do
      {
        title: 'Hello',
        visibility: 'everyone'
      }
    end

    it { expect(errors).not_to include :title }
    it { expect(errors).not_to include :user }
    it { expect(errors).not_to include :checklist }
    it { expect(errors).not_to include :checklist_template }
    it { is_expected.to be_valid }

    it 'creates a checklist' do
      expect do
        subject.save
      end.to change(Checklist, :count).by(1)
    end

    it 'creates a checklist template' do
      expect do
        subject.save
      end.to change(ChecklistTemplate, :count).by(1)
    end

    it 'checklist has same user' do
      subject.save
      expect(subject.checklist.user).to eq user
    end
  end

  context 'invalid params' do
    let(:params) { {} }

    it { expect(errors).to include :title }
    it { is_expected.to_not be_valid }

    it 'does not creates a checklist' do
      expect do
        subject.save
      end.to_not change(Checklist, :count)
    end

    it 'does not creates a checklist template' do
      expect do
        subject.save
      end.to_not change(ChecklistTemplate, :count)
    end
  end
end
