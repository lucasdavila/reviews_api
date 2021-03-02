module Types
  class ReviewType < Types::BaseUnion
    possible_types Types::HotelReviewType, Types::RestaurantReviewType

    def self.resolve_type(object, context)
      if object.hotel?
        Types::HotelReviewType
      elsif object.restaurant?
        Types::RestaurantReviewType
      else
        raise 'Unknown review type!'
      end
    end
  end
end
