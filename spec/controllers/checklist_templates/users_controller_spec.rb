require 'rails_helper'

RSpec.describe ChecklistTemplates::UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }
  let(:checklist_template_class) { class_double("ChecklistTemplate").as_stubbed_const }

  describe '#index' do
    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in user
        get :show
        expect(response).to have_http_status '200'
      end

      it 'shows only users checklists' do
        sign_in user
        expect(checklist_template_class).to receive(:where).with(user: user)
        get :show
      end
    end

    context 'as a guest' do
      it_behaves_like 'as guest', request: 'get', method: 'show'
    end
  end
end
