require 'rails_helper'

RSpec.describe ChecklistTemplates::SearchesController, type: :controller do
  let(:user) { double('user') }
  let(:checklist_template) { class_double("ChecklistTemplate").as_stubbed_const }

  describe '#show' do
    context 'as an authenticated user' do
      before do
        allow(request.env['warden']).to receive(:authenticate!).and_return(:user)
      end

      it 'responds successfully' do
        get :show
        expect(response).to have_http_status '200'
      end

      it 'searches by the provided keyword' do
        expect(checklist_template).to receive(:search).with('sport')
        get :show, params: { search: 'sport' }
      end
    end
  end
end
