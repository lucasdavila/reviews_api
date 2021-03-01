# frozen_string_literal: true
class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating
      t.string :author
      t.jsonb :data, default: {}, null: false

      t.timestamps
    end
  end
end
