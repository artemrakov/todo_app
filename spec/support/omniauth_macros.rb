module OmniauthMacros
  def facebook_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      provider: "facebook",
      uid: "123545",
      info: {
        email: "example_facebook@test.com",
        name: "Test Tester",
        image: "http://placehold.it/30x30"
      },
      credentials: {
        token: 'EAAJuIi4iq9IBAGa94r93nEZBxJVEXKCmMy2anzcKEg4n8m0lgWHnF',
        expires_at: 1_564_064_270
      }
    )
  end
end
