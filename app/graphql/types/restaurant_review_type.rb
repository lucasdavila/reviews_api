# frozen_string_literal: true

module Types
  class RestaurantReviewType < Types::BaseObject
    field :id, ID, null: false
    field :review, Integer, null: false
    field :author, String, null: false

    def id
      object.data['restaurant_id']
    end

    def review
      object.rating
    end
  end
end
