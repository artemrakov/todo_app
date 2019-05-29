require 'rails_helper'

RSpec.describe TemplateItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:checklist_template) { create(:checklist_template, user: user) }
  let(:template_item) { create(:template_item, checklist_template: checklist_template) }

  describe '#create' do
    context 'as an authenticated user' do
      context 'with valid attributes' do
        it 'adds a template item' do
          template_item_params = FactoryBot.attributes_for(:template_item)
          sign_in user
          expect do
            post :create, params: { checklist_template_id: checklist_template.id, template_item: template_item_params }
          end.to change(checklist_template.template_items, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a template_item' do
          template_item_params = FactoryBot.attributes_for(:item, :invalid)
          sign_in user

          expect do
            post :create, params: { checklist_template_id: checklist_template.id, template_item: template_item_params }
          end.to_not change(checklist_template.template_items, :count)
        end
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end

  describe '#update' do
    context 'as an authenticated user' do
      it 'updates a item' do
        template_item_params = FactoryBot.attributes_for(:item, title: 'New item title')
        sign_in user
        patch :update, params: {
          checklist_template_id: checklist_template.id,
          template_item: template_item_params,
          id: template_item.id
        }
        expect(template_item.reload.title).to eq 'New item title'
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      it 'delete a item' do
        sign_in user
        template_item
        expect do
          delete :destroy, params: { checklist_template_id: checklist_template.id, id: template_item.id }
        end.to change(checklist_template.template_items, :count).by(-1)
      end
    end

    # TODO: add pundit, create tests for unauthenticated user
  end
end
