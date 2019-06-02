require 'rails_helper'

RSpec.describe ChecklistPolicy do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:checklist) { create(:checklist, user: user) }

  subject { described_class }

  permissions :update?, :show?, :destroy? do
    it 'grants access only to owner of checklist' do
      expect(subject).to permit(user, checklist)
    end

    it 'doesnt grant access to other user' do
      expect(subject).to_not permit(other_user, checklist)
    end
  end
end
