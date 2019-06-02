require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:checklist_template) { create(:checklist_template, user: user) }
  let(:checklist) { create(:checklist, user: user, checklist_template: checklist_template) }
  let!(:item) { create(:item, checklist: checklist) }

  describe '#update' do
    context 'as an authenticated user' do
      it 'updates an item' do
        item_params = attributes_for(:item, title: 'New item title')
        sign_in user
        patch :update, params: { checklist_id: checklist.id, item: item_params, id: item.id }
        expect(item.reload.title).to eq 'New item title'
      end
    end

    context 'as an unauthenticated user' do
      before do
        sign_in other_user
      end

      it 'does not update item' do
        item_params = attributes_for(:item, title: 'New item title')
        patch :update, params: { checklist_id: checklist.id, item: item_params, id: item.id }
        expect(item.reload.title).to_not eq 'New item title'
      end
    end
  end

  describe '#create' do
    context 'as an authenticated user' do
      before do
        sign_in user
      end

      context 'with valid attributes' do
        it 'adds an item' do
          item_params = attributes_for(:item)
          expect do
            post :create, params: { checklist_id: checklist.id, item: item_params }
          end.to change(checklist.reload.items, :count).by(1)
        end

        it 'adds CustomItem' do
          item_params = attributes_for(:item)
          expect do
            post :create, params: { checklist_id: checklist.id, item: item_params }
          end.to change(CustomItem, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a item' do
          item_params = attributes_for(:item, :invalid)
          expect do
            post :create, params: { checklist_id: checklist.id, item: item_params }
          end.to_not change(checklist.reload.items, :count)
        end
      end
    end

    context 'as an unauthenticated user' do
      before do
        sign_in other_user
      end

      it 'does not creates item' do
        item_params = attributes_for(:item)
        expect do
          post :create, params: { checklist_id: checklist.id, item: item_params }
        end.to_not change(Item, :count)
      end
    end
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      it 'delete an item' do
        sign_in user
        expect do
          delete :destroy, params: { checklist_id: checklist.id, id: item.id }
        end.to change(checklist.items, :count).by(-1)
      end
    end

    context 'as an unautheticated user' do
      before do
        sign_in other_user
      end

      it 'does not deletes an item' do
        expect do
          delete :destroy, params: { checklist_id: checklist.id, id: item.id }
        end.to_not change(Item, :count)
      end
    end
  end
end
