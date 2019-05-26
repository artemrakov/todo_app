module UserHelper
  DEFAULT_AVATAR_URL = "http://placehold.it/30x30".freeze

  def avatar_url
    current_user.facebook_picture_url || DEFAULT_AVATAR_URL
  end
end
