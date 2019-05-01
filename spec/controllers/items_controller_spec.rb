require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  # TODO: add belongs_to template_item optional
  # describe '#create' do
  #   context 'as an authenticated user' do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       @checklist = FactoryBot.create(:checklist, user: @user)
  #     end

  #     context 'with valid attributes' do
  #       it 'adds a item' do
  #         item_params = FactoryBot.attributes_for(:item)
  #         sign_in @user
  #         expect {
  #           post :create, params: { checklist_id: @checklist.id, item: item_params }
  #         }.to change(@checklist.items, :count).by(1)
  #       end
  #     end

  #     context 'with invalid attributes' do
  #       it 'does not add a item' do
  #         item_params = FactoryBot.attributes_for(:item, :invalid)
  #         sign_in @user

  #         expect {
  #           post :create, params: { checklist_id: @checklist.id, item: item_params }
  #         }.to_not change(@checklist.items, :count)
  #       end
  #     end
  #   end

  describe '#update' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist = FactoryBot.create(:checklist, user: @user)
        @item = FactoryBot.create(:item, checklist: @checklist)
      end
      it 'updates a item' do
        item_params = FactoryBot.attributes_for(:item, title: 'New item title')
        sign_in @user
        patch :update, params: { checklist_id: @checklist.id, item: item_params, id: @item.id }
        expect(@item.reload.title).to eq 'New item title'
      end
    end

    # TODO add pundit, create tests for unauthenticated user
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist = FactoryBot.create(:checklist, user: @user)
        @item = FactoryBot.create(:item, checklist: @checklist)
      end

      it 'delete a item' do
        sign_in @user
        expect {
          delete :destroy, params: { checklist_id: @checklist.id, id: @item.id }
        }.to change(@checklist.items, :count).by(-1)
      end
    end

    # TODO add pundit, create tests for unauthenticated user
  end
end
