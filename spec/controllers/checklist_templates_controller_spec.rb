require 'rails_helper'

RSpec.describe ChecklistTemplatesController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template) }

  describe '#index' do
    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in user
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
      it 'responds successfully' do
        sign_in user
        get :show, params: { id: checklist_template.id }
        expect(response).to have_http_status '200'
      end
    end
  end

  describe '#create' do
    context 'as an authenticated user' do
      context 'with valid attributes' do
        it 'adds a checklist_template' do
          checklist_template_params = FactoryBot.attributes_for(:checklist_template)
          sign_in user
          expect do
            post :create, params: { checklist_template: checklist_template_params }
          end.to change(ChecklistTemplate, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a checklist_template' do
          checklist_template_params = FactoryBot.attributes_for(:checklist_template, :invalid)
          sign_in user
          expect do
            post :create, params: { checklist_template: checklist_template_params }
          end.to_not change(ChecklistTemplate, :count)
        end
      end
    end
  end

  describe '#create_checklist' do
    context 'as an authenticated user' do
      context 'with valid attributes' do
        it 'creates checklist' do
          sign_in user
          expect do
            post :create_checklist, params: { id: checklist_template.id }
          end.to change(user.checklists, :count).by(1)
        end
      end
    end
  end
end
