module Queries
  class Reviews < Queries::Base
    type [ Types::ReviewType ], null: false

    def resolve
      # FIXME ideally it should not fetch ALL reviews from db
      # it could use pagination for example, to prevent loading all db reviews.
      Review.all
    end
  end
end