require 'rails_helper'

RSpec.describe ChecklistTemplatePolicy do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }

  subject { described_class }

  permissions :new?, :show?, :create? do
    it 'grants access to everybody' do
      expect(subject).to permit(user, checklist_template)
    end
  end
end
