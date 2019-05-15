require 'rails_helper'

RSpec.describe ChecklistTemplateCollectionView do
  let(:view_model) { ChecklistTemplateCollectionView.new({}) }

  it 'returns checklists' do
    expect(view_model.checklist_templates).to_not eq nil
  end
end
