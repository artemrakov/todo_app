RSpec.shared_examples_for 'as guest' do |args|
  context 'as a guest' do
    it 'returns a 302 response' do
      send(args[:request], args[:method], params: args[:params])
      expect(response).to have_http_status '302'
    end

    it 'redirects to sign-in page' do
      send(args[:request], args[:method], params: args[:params])
      expect(response).to redirect_to '/users/sign_in'
    end
  end
end
