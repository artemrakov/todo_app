require 'rails_helper'

RSpec.describe ChecklistTemplatePaginationView do
  let(:view_model) { ChecklistTemplatePaginationView.new({}) }

  it 'returns checklists' do
    expect(view_model.checklist_templates).to_not eq nil
  end

  it 'returns pagination' do
    expect(view_model.pagination).to_not eq nil
  end
end
