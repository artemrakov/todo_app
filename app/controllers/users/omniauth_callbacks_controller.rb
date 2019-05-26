class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = find_for_facebook_oauth

    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = auth
      redirect_to new_user_registration_url
    end
  end

  private

  def find_for_facebook_oauth
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email)
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0, 20]
      user.save
    end

    user
  end

  def user_params
    @user_params ||= {
      facebook_picture_url: auth.info.image,
      token: auth.credentials.token,
      token_expiry: Time.at(auth.credentials.expires_at),
      email: auth.info.email,
      provider: auth.provider,
      uid: auth.uid,
      first_name: auth.info.name.split[0],
      last_name: auth.info.name.split[1]
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
