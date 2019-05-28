require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  describe '#facebook' do
    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = facebook_hash
    end

    it 'creates a user' do
      expect do
        get :facebook
      end.to change(User, :count).by(1)
    end

    it 'finds user if user exist' do
      create(:user, email: facebook_hash.info.email)

      expect do
        get :facebook
      end.to_not change(User, :count)
    end

    it 'should redirect to root_path' do
      get :facebook
      expect(response).to redirect_to root_url
    end
  end
end
