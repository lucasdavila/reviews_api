# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::AddRestaurantReview, type: :request do
  # TODO: test basic auth

  describe 'POST /graphql' do
    let(:data) { { id: 'b6e67f78-1f92-41e6-9217-caff36e9f46f', review: 5, author: 'Jake the Human' } }

    let(:query) do
      <<~QUERY
        mutation {
          addRestaurantReview(input: { id: "#{data[:id]}", review: #{data[:review]}, author: "#{data[:author]}" }) {
            restaurantReview {
              id
              review
              author
            }
          }
        }
      QUERY
    end

    it_behaves_like 'api key authorization'

    it 'adds a restaurant review' do
      expect do
        post '/graphql', params: { query: query }, headers: headers
      end.to change { Review.count }.by(1)

      expect(response.status).to eq 200
      expect(response_data['data']['addRestaurantReview']['restaurantReview']).to eq(data.stringify_keys)
    end
  end
end
