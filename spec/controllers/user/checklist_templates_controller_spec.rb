require 'rails_helper'

RSpec.describe User::ChecklistTemplatesController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }
  let(:current_user) { double('current_user') }

  describe '#index' do
    context 'as an authenticated user' do
      before do
        sign_in user
      end

      it 'responds successfully' do
        get :index
        expect(response).to have_http_status '200'
      end

      it 'shows only users checklists templates' do
        allow(controller).to receive(:current_user).and_return(user)
        expect(user).to receive(:checklist_templates)
        get :index
      end
    end

    context 'as a guest' do
      it_behaves_like 'as guest', request: 'get', method: 'index'
    end
  end
end
