# frozen_string_literal: true

module Types
  module Input
    class RestaurantReviewInputType < Types::BaseInputObject
      argument :id, Id, required: true
      argument :review, Int, required: true
      argument :author, String, required: true
    end
  end
end
