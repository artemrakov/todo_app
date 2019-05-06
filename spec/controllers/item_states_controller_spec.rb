require 'rails_helper'

RSpec.describe ItemStatesController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item) }
  let(:item_done) { create(:item, :complete) }

  describe '#create' do
    context 'as an authenticated user' do
      it 'changes status of the item to done' do
        sign_in user
        post :create, params: { id: item.id }
        expect(item.reload.state).to eq 'done'
      end
    end

    it_behaves_like 'as guest', request: 'post', method: 'create', params: { id: 1 }
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      it 'changes status of item to not_done' do
        sign_in user
        delete :destroy, params: { id: item_done.id }
        expect(item_done.reload.state).to eq 'not_done'
      end
    end

    it_behaves_like 'as guest', request: 'delete', method: 'destroy', params: { id: 1 }
  end
end
