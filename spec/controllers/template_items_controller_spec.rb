require 'rails_helper'

RSpec.describe TemplateItemsController, type: :controller do
  describe '#create' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist_template = FactoryBot.create(:checklist_template)
      end

      context 'with valid attributes' do
        it 'adds a template item' do
          template_item_params = FactoryBot.attributes_for(:template_item)
          sign_in @user
          expect do
            post :create, params: { checklist_template_id: @checklist_template.id, template_item: template_item_params }
          end.to change(@checklist_template.template_items, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a template_item' do
          template_item_params = FactoryBot.attributes_for(:item, :invalid)
          sign_in @user

          expect do
            post :create, params: { checklist_template_id: @checklist_template.id, template_item: template_item_params }
          end.to_not change(@checklist_template.template_items, :count)
        end
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end

  describe '#update' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist_template = FactoryBot.create(:checklist_template)
        @template_item = FactoryBot.create(:template_item, checklist_template: @checklist_template)
      end
      it 'updates a item' do
        template_item_params = FactoryBot.attributes_for(:item, title: 'New item title')
        sign_in @user
        patch :update, params: {
          checklist_template_id: @checklist_template.id,
          template_item: template_item_params,
          id: @template_item.id
        }
        expect(@template_item.reload.title).to eq 'New item title'
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      before do
        @user = FactoryBot.create(:user)
        @checklist_template = FactoryBot.create(:checklist_template)
        @template_item = FactoryBot.create(:template_item, checklist_template: @checklist_template)
      end

      it 'delete a item' do
        sign_in @user
        expect do
          delete :destroy, params: { checklist_template_id: @checklist_template.id, id: @template_item.id }
        end.to change(@checklist_template.template_items, :count).by(-1)
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end
end
