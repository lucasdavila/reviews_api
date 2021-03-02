module Queries
  class Reviews < Queries::Base

    type [ Types::ReviewType ], null: false

    def resolve
      # Review.where("data->'hotel_id' IS NOT NULL")
      Review.all
    end
  end
end