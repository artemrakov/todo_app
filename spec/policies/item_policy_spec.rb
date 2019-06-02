require 'rails_helper'

RSpec.describe ItemPolicy do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:checklist) { create(:checklist, user: user) }
  let(:item) { create(:item, checklist: checklist) }

  subject { described_class }

  permissions :update?, :create?, :destroy? do
    it 'grants access only to owner of checklist where item exist' do
      expect(subject).to permit(user, item)
    end

    it 'doesnt grant access to other user' do
      expect(subject).to_not permit(other_user, item)
    end
  end
end
