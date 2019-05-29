require 'rails_helper'

RSpec.describe ItemResolutionsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:checklist) { create(:checklist, user: user) }
  let(:item) { create(:item, checklist: checklist) }
  let!(:item_done) { create(:item, :complete, checklist: checklist) }
  let(:custom_item) { create(:item, :custom, checklist: checklist) }

  describe '#create' do
    context 'as an authenticated user' do
      before do
        sign_in user
      end

      it 'changes status of the item to done' do
        post :create, params: { item_id: item.id, checklist_id: checklist.id }
        expect(item.reload.state).to eq 'done'
      end
    end

    context 'as an unauthenticated user' do
      before do
        sign_in other_user
      end

      it 'does not changes status of item' do
        post :create, params: { item_id: item.id, checklist_id: checklist.id }
        expect(item.reload.state).to_not eq 'done'
      end
    end

    context 'as a guest' do
      it_behaves_like 'as guest', request: 'post', method: 'create' do
        let(:item) { create(:item) }
        let(:checklist) { create(:checklist) }
        let(:params) { { item_id: item.id, checklist_id: checklist.id } }
      end
    end
  end

  describe '#delete' do
    context 'as an authenticated user' do
      it 'changes status of item to not_done' do
        sign_in user
        delete :destroy, params: { item_id: item_done.id, checklist_id: checklist.id }
        expect(item.reload.state).to eq 'not_done'
      end
    end

    context 'as an unauthenticated user' do
      it 'does not changes status of item' do
        sign_in other_user
        delete :destroy, params: { item_id: item_done.id, checklist_id: checklist.id }
        expect(item.reload.state).to_not eq 'not_done'
      end
    end

    context 'as guest' do
      it_behaves_like 'as guest', request: 'post', method: 'create' do
        let(:item_done) { create(:item, :complete) }
        let(:checklist) { create(:checklist) }
        let(:params) { { item_id: item.id, checklist_id: checklist.id } }
      end
    end
  end
end
