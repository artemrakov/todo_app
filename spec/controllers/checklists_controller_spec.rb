require 'rails_helper'

RSpec.describe ChecklistsController, type: :controller do
  describe '#index' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      it 'responds successfully' do
        sign_in @user
        get :index
        expect(response).to have_http_status '200'
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        get :index
        expect(response).to have_http_status '302'
      end

      it 'redirects to sign-in page' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#show' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist = FactoryBot.create(:checklist)
      end

      it 'responds successfully' do
        sign_in @user
        get :show, params: { id: @checklist.id }
        expect(response).to have_http_status '200'
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end

  describe '#update' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist = FactoryBot.create(:checklist, user: @user)
      end
      it 'updates a checklist' do
        checklist_params = FactoryBot.attributes_for(:checklist, title: 'New Checklist name')
        sign_in @user
        patch :update, params: { id: @checklist.id, checklist: checklist_params }
        expect(@checklist.reload.title).to eq 'New Checklist name'
      end
    end

    # TODO: add pundit create tests for unauthenticated user
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist = FactoryBot.create(:checklist, user: @user)
      end

      it 'deletes a checklist' do
        sign_in @user
        expect do
          delete :destroy, params: { id: @checklist.id }
        end.to change(@user.checklists, :count).by(-1)
      end
    end

    # TODO: add pundit create tests for unauthenticated user
  end
end
