# frozen_string_literal: true

class Review < ApplicationRecord
  DATA_JSON_SCHEMA = Rails.root.join('app/models/schemas/review/data.json').to_s

  validates :author, presence: true
  validates :body, presence: true, length: { minimum: 10 }, if: :hotel?
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1,
                                                     less_than_or_equal_to: 5 }, if: :restaurant?
  validates :data, json: { schema: DATA_JSON_SCHEMA, message: ->(errors) { errors } }

  def hotel?
    data['hotel_id'].present?
  end

  def restaurant?
    data['restaurant_id'].present?
  end
end
