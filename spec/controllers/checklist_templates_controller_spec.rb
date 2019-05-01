require 'rails_helper'

RSpec.describe ChecklistTemplatesController, type: :controller do
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
        @checklist_template = FactoryBot.create(:checklist_template)
      end

      it 'responds successfully' do
        sign_in @user
        get :show, params: { id: @checklist_template.id }
        expect(response).to have_http_status '200'
      end
    end
  end

  describe '#create' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
      end

      context 'with valid attributes' do
        it 'adds a checklist_template' do
          checklist_template_params = FactoryBot.attributes_for(:checklist_template)
          sign_in @user
          expect {
            post :create, params: { checklist_template: checklist_template_params }
          }.to change(ChecklistTemplate, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a checklist_template' do
          checklist_template_params = FactoryBot.attributes_for(:checklist_template, :invalid)
          sign_in @user
          expect {
            post :create, params: { checklist_template: checklist_template_params }
          }.to_not change(ChecklistTemplate, :count)
        end
      end
    end
  end

  describe '#create_checklist' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist_template = FactoryBot.create(:checklist_template)
      end

      context 'with valid attributes' do
        it 'creates checklist' do
          sign_in @user
          expect {
            post :create_checklist, params: { id: @checklist_template.id }
          }.to change(@user.checklists, :count).by(1)
        end
      end
    end
  end
end
