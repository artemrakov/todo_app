require 'rails_helper'

RSpec.describe ChecklistCopiesController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }

  describe '#create' do
    context 'as an authenticated user' do
      before do
        sign_in user
      end

      it 'creates checklist' do
        expect do
          post :create, params: { checklist_template_id: checklist_template.id }
        end.to change(user.reload.checklists, :count).by(1)
      end
    end

    context 'as a guest' do
      it_behaves_like 'as guest', request: 'post', method: 'create' do
        let(:checklist_template) { create(:checklist_template) }
        let(:params) { { checklist_template_id: checklist_template.id } }
      end
    end
    # TODO: add pundit, create tests for unauthenticated user
  end
end
