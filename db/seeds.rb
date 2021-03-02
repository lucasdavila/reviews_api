# frozen_string_literal: true

return unless Rails.env.development?

Review.create(body: 'Awesome hotel!', author: 'Jake the Dog', data: { hotel_id: 1 })
Review.create(body: 'Loved this hotel!', author: 'Finn the human', data: { hotel_id: 2 })
Review.create(rating: 5, author: 'Princess bubblegum', data: { restaurant_id: '8f4bce50-4f07-4ec8-801e-28ca7267948e' })
Review.create(rating: 1, author: 'Lumpy Space Princess', data: { restaurant_id: '8f4bce50-4f07-4ec8-801e-28ca7267948e' })