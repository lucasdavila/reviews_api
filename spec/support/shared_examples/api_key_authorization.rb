# frozen_string_literal: true

RSpec.shared_examples 'api key authorization' do |_options|
  context 'without API_KEY header' do
    it 'returns an unauthorized error' do
      post '/graphql', params: {}

      expect(response.status).to eq 401
    end
  end

  context 'with a wrong API_KEY header' do
    it 'returns an unauthorized error' do
      post '/graphql', params: {}, headers: { 'HTTP_API_KEY' => 'foo-123' }

      expect(response.status).to eq 401
    end
  end
end
