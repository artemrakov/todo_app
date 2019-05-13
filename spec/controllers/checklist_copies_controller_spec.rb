require 'rails_helper'

RSpec.describe ChecklistCopiesController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }

  describe '#create' do
    context 'as an authenticated user' do
      context 'with valid attributes' do
        it 'creates checklist' do
          sign_in user
          expect do
            post :create, params: { checklist_template_id: checklist_template.id }
          end.to change(user.reload.checklists, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not create checklist' do
          checklist_template.update_attribute(:title, '')
          sign_in user
          expect do
            post :create, params: { checklist_template_id: checklist_template.id }
          end.to_not change(user.reload.checklists, :count)
        end
      end
    end
    # TODO: add pundit, create tests for unauthenticated user
  end
end
