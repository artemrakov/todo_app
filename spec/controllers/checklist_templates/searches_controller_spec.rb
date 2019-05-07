require 'rails_helper'

RSpec.describe ChecklistTemplates::SearchesController, type: :controller do
  let(:user) { double('user') }
  let(:checklist_template) { class_double("ChecklistTemplate").as_stubbed_const }

  describe '#show' do
    context 'as an authenticated user' do
      before do
        allow(request.env['warden']).to receive(:authenticate!).and_return(:user)
      end

      it 'searches by the provided keyword and private false' do
        expect(checklist_template).to receive(:search).with('sport', where: { private: false })
        get :show, params: { search: 'sport' }
      end
    end
  end
end
