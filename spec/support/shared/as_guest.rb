RSpec.shared_examples_for 'as guest' do |args|
  it 'returns a 302 and redirects response' do
    send(args[:request], args[:method], params: params)
    expect(response).to have_http_status '302'
    expect(response).to redirect_to '/users/sign_in'
  end
end
