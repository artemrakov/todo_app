require 'rails_helper'

RSpec.describe CompletesController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item) }

  describe '#create' do
    context 'as an authenticated user' do
      it 'changes status of the item to done' do
        sign_in user
        post :create, params: { item_id: item.id }
        expect(item.reload.state).to eq 'done'
      end
    end

    context 'as a guest' do
      it_behaves_like 'as guest', request: 'post', method: 'create' do
        let(:item) { create(:item) }
        let(:params) { { item_id: item.id } }
      end
    end
  end
end
