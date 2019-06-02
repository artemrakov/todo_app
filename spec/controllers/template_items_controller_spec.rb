require 'rails_helper'

RSpec.describe TemplateItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:checklist_template) { create(:checklist_template, user: user) }
  let!(:template_item) { create(:template_item, checklist_template: checklist_template) }

  describe '#create' do
    context 'as an authenticated user' do
      context 'with valid attributes' do
        it 'adds a template item' do
          template_item_params = attributes_for(:template_item)
          sign_in user
          expect do
            post :create, params: { checklist_template_id: checklist_template.id, template_item: template_item_params }
          end.to change(checklist_template.template_items, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        it 'does not add a template_item' do
          template_item_params = attributes_for(:item, :invalid)
          sign_in user

          expect do
            post :create, params: { checklist_template_id: checklist_template.id, template_item: template_item_params }
          end.to_not change(checklist_template.template_items, :count)
        end
      end
    end

    context 'as an unauthenticated user' do
      before do
        sign_in other_user
      end

      it 'does not create a template item' do
        template_item_params = attributes_for(:template_item)
        expect do
          post :create, params: { checklist_template_id: checklist_template.id, template_item: template_item_params }
        end.to_not change(TemplateItem, :count)
      end
    end
  end

  describe '#update' do
    context 'as an authenticated user' do
      it 'updates an item' do
        template_item_params = attributes_for(:template_item, title: 'New item title')
        sign_in user
        patch :update, params: {
          checklist_template_id: checklist_template.id,
          template_item: template_item_params,
          id: template_item.id
        }
        expect(template_item.reload.title).to eq 'New item title'
      end
    end

    context 'as an unauthenticated user' do
      before do
        sign_in other_user
      end

      it 'does not change template item' do
        template_item_params = attributes_for(:item, title: 'New item title')
        patch :update, params: {
          checklist_template_id: checklist_template.id,
          template_item: template_item_params,
          id: template_item.id
        }
        expect(template_item.reload.title).to_not eq 'New item title'
      end
    end
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      it 'delete a template item' do
        sign_in user
        expect do
          delete :destroy, params: { checklist_template_id: checklist_template.id, id: template_item.id }
        end.to change(checklist_template.template_items, :count).by(-1)
      end
    end

    context 'as an unauthenticated user' do
      before do
        sign_in other_user
      end

      it 'does not deletes a template item' do
        expect do
          delete :destroy, params: { checklist_template_id: checklist_template.id, id: template_item.id }
        end.to_not change(TemplateItem, :count)
      end
    end
  end
end
