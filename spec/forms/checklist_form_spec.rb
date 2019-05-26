require 'rails_helper'

RSpec.describe ChecklistForm do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }
  let(:checklist_form_invalid) do
    ChecklistForm.new(
      user: user,
      checklist_template: checklist_template,
      title: ''
    )
  end

  context 'with valid params' do
    let(:params) do
      {
        user: user,
        checklist_template: checklist_template,
        title: checklist_template.title
      }
    end
    let(:checklist_form) { ChecklistForm.new(params) }

    it 'creates a checklist from template checklist' do
      expect do
        checklist_form.save
      end.to change(checklist_template.reload.checklists, :count).by(1)
    end

    it 'has same number of items' do
      checklist_form.save
      expect(checklist_form.checklist.items).to eq checklist_template.template_items
    end
  end

  context 'with invalid params' do
    let(:invalid_params) do
      {
        user: user,
        checklist_template: checklist_template,
        title: ''
      }
    end
    let(:checklist_form) { ChecklistForm.new(invalid_params) }

    it 'doesnt create checklist from invalid attributes' do
      expect do
        checklist_form.save
      end.to_not change(checklist_template.reload.checklists, :count)
    end
  end
end
