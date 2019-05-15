require 'rails_helper'

RSpec.describe ChecklistCollectionView do
  let(:view_model) { ChecklistCollectionView.new({}) }

  it 'returns checklists' do
    expect(view_model.checklists).to_not eq nil
  end
end
