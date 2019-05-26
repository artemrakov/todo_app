require 'rails_helper'

RSpec.describe ChecklistCreationService do
  let(:user) { create(:user) }

  context 'valid params' do
    let(:params) do
      {
        checklist: { title: 'Hello' },
        visability: 'everyone'
      }
    end

    let(:checklist_creation_service) { ChecklistCreationService.new(params, user) }

    it 'creates a checklist' do
      expect do
        checklist_creation_service.save
      end.to change(Checklist, :count).by(1)
    end

    it 'creates a checklist template' do
      expect do
        checklist_creation_service.save
      end.to change(ChecklistTemplate, :count).by(1)
    end

    it 'checklist has same user' do
      checklist_creation_service.save
      expect(checklist_creation_service.checklist.user).to eq user
    end
  end

  context 'invalid params' do
    let(:invalid_params) do
      {
        checklist: { title: '' },
        visability: 'everyone'
      }
    end

    let(:checklist_creation_service) { ChecklistCreationService.new(invalid_params, user) }

    it 'does not creates a checklist' do
      expect do
        checklist_creation_service.save
      end.to_not change(Checklist, :count)
    end

    it 'does not creates a checklist template' do
      expect do
        checklist_creation_service.save
      end.to_not change(ChecklistTemplate, :count)
    end
  end
end
