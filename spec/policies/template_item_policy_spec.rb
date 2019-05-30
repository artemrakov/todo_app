require 'rails_helper'

RSpec.describe TemplateItemPolicy do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:checklist_template) { create(:checklist_template, user: user) }
  let(:template_item) { create(:template_item, checklist_template: checklist_template) }

  subject { described_class }

  permissions :update?, :create?, :destroy? do
    it 'grants access only to owner of checklist template where template item exist' do
      expect(subject).to permit(user, template_item)
    end

    it 'doesnt grant access to other user' do
      expect(subject).to_not permit(other_user, template_item)
    end
  end
end
