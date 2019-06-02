require 'rails_helper'

RSpec.describe ElementsDueQuery do
  let!(:checklist) { create(:checklist) }
  let!(:checklist1) { create(:checklist, :due_tomorrow) }
  let!(:checklist2) { create(:checklist, :due_today) }
  let!(:item) { create(:item, :due_tomorrow, checklist: checklist1) }
  let!(:item1) { create(:item, checklist: checklist1) }
  let!(:item2) { create(:item, checklist: checklist2) }
  let!(:item3) { create(:item, :due_today, checklist: checklist2) }

  subject { described_class.call }

  context '#call' do
    it 'returns correct elements' do
      is_expected.to match_array [checklist1, checklist2, item, item3]
    end
  end
end
