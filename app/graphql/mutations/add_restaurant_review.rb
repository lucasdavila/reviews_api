# frozen_string_literal: true

module Mutations
  class AddRestaurantReview < BaseMutation
    field :restaurant_review, Types::RestaurantReviewType, null: false

    argument :id, String, required: true
    argument :review, Int, required: true
    argument :author, String, required: true

    def resolve(id:, review:, author:)
      review = Review.new(rating: review, author: author, data: { 'restaurant_id' => id })

      return model_errors(review) unless review.save

      { restaurant_review: review }
    end
  end
end
