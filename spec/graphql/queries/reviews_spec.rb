# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::Reviews, type: :request do
  # TODO: test basic auth

  describe 'POST /graphql' do
    let!(:hotel_review) { create(:hotel_review) }
    let!(:restaurant_review) { create(:restaurant_review) }

    let(:query) do
      <<~QUERY
        query {
          reviews {
            ... on HotelReview {
              __typename
              id
              review
              author
            }

            ... on RestaurantReview {
              __typename
              id
              review
              author
            }
          }
        }
      QUERY
    end

    it_behaves_like 'api key authorization'

    it 'fetches both hotel and restaurant reviews' do
      post '/graphql', params: { query: query }, headers: headers

      expect(response.status).to eq 200

      expect(response_data['data']['reviews']).to include(
        '__typename' => 'HotelReview',
        'id' => hotel_review.data['hotel_id'],
        'review' => hotel_review.body,
        'author' => hotel_review.author
      )

      expect(response_data['data']['reviews']).to include(
        '__typename' => 'RestaurantReview',
        'id' => restaurant_review.data['restaurant_id'],
        'review' => restaurant_review.rating,
        'author' => restaurant_review.author
      )
    end
  end
end
