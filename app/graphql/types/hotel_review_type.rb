module Types
  class HotelReviewType < Types::BaseObject
    field :id, Int, null: false
    field :review, String, null: false
    field :author, String, null: false

    def id
      object.data['hotel_id']
    end

    def review
      object.body
    end
  end
end
