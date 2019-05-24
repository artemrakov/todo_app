require 'rails_helper'

RSpec.describe Users::ChecklistTemplatesController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }

  describe '#index' do
    context 'as an authenticated user' do
      before do
        sign_in user
      end

      it 'responds successfully' do
        get :index, params: { user_id: user.id }
        expect(response).to have_http_status '200'
      end
    end

    context 'as a guest' do
      it_behaves_like 'as guest', request: 'get', method: 'index' do
        let(:user) { create(:user) }
        let(:params) { { user_id: user.id } }
      end
    end
  end
end
