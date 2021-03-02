# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::AddHotelReview, type: :request do
  # TODO: test basic auth

  describe 'POST /graphql' do
    let(:data) { { id: 1, review: 'Great hotel!!', author: 'Finn the Dog' } }

    let(:query) do
      <<~QUERY
        mutation {
          addHotelReview(input: { id: #{data[:id]}, review: "#{data[:review]}", author: "#{data[:author]}" }) {
            hotelReview {
              id
              review
              author
            }
          }
        }
      QUERY
    end

    it 'adds a hotel review' do
      expect do
        post '/graphql', params: { query: query }
      end.to change { Review.count }.by(1)

      expect(response_data['data']['addHotelReview']['hotelReview']).to eq(data.stringify_keys)
    end
  end
end
