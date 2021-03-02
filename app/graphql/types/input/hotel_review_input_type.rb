# frozen_string_literal: true

module Types
  module Input
    class HotelReviewInputType < Types::BaseInputObject
      argument :id, ID, required: true
      argument :review, String, required: true
      argument :author, String, required: true
    end
  end
end
