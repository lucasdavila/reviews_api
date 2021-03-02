module Mutations
  class AddHotelReview < BaseMutation
    field :hotel_review, Types::HotelReviewType, null: false

    argument :id, Int, required: true
    argument :review, String, required: true
    argument :author, String, required: true

    def resolve(id:, review:, author:)
      review = Review.new(body: review, author: author, data: { 'hotel_id' => id })

      return model_errors(review) unless review.save

      { hotel_review: review }
    end
  end
end
