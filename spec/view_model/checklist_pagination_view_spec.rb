require 'rails_helper'

RSpec.describe ChecklistPaginationView do
  let(:view_model) { ChecklistPaginationView.new({}) }

  it 'returns checklists' do
    expect(view_model.checklists).to_not eq nil
  end

  it 'returns pagination' do
    expect(view_model.pagination).to_not eq nil
  end
end
