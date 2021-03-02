# frozen_string_literal: true

FactoryBot.define do
  factory :hotel_review, class: 'Review' do
    body { 'Alwesome hotel!' }
    author { 'Jake the Dog' }
    data { { hotel_id: 1 } }
  end

  factory :restaurant_review, class: Review do
    rating { 5 }
    author { 'Finn the Human' }
    data { { restaurant_id: 'a9a42018-893a-4c82-a348-95e39effb987' } }
  end
end
