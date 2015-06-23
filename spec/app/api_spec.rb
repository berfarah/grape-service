describe App::API do
  include Rack::Test::Methods

  def app
    App::API
  end

  context 'page not found' do
    before do
      get '/made_up_page'
      expect(last_response.status).to eq(404)
      @error = JSON.parse(last_response.body)['error']
    end
  end
end
