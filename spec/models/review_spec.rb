# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to_not validate_presence_of(:body) }
    it { is_expected.to_not validate_presence_of(:rating) }

    describe 'data validations' do
      before { subject.valid? }

      it 'requires hotel_id or restaurant_id' do
        expect(subject.errors['data']).to include(match("The property '#/' did not contain a required property of 'hotel_id'"))
        expect(subject.errors['data']).to include(match("The property '#/' did not contain a required property of 'restaurant_id'"))
      end
    end

    context 'when it is a hotel review' do
      before { subject.data = { 'hotel_id' => 1 } }

      it { is_expected.to validate_presence_of(:body) }
      it { is_expected.to validate_length_of(:body).is_at_least(10) }

      describe 'data validations' do
        before do
          subject.data['hotel_id'] = 'abc'
          subject.valid?
        end

        it 'validates hotel_id is integer' do
          expect(subject.errors['data']).to include(match("The property '#/hotel_id' of type string did not match the following type: integer"))
        end
      end
    end

    context 'when it is a restaurant review' do
      before { subject.data = { 'restaurant_id' => 1 } }

      it { is_expected.to validate_presence_of(:rating) }

      it do
        is_expected.to validate_numericality_of(:rating)
          .is_greater_than_or_equal_to(1)
          .is_less_than_or_equal_to(5)
      end

      describe 'data validations' do
        before do
          subject.data['restaurant_id'] = restaurant_id
          subject.valid?
        end

        let(:restaurant_id) { 'abc' }

        it 'validates restaurant_id is in uuid format' do
          expect(subject.errors['data']).to include(match("The property '#/restaurant_id' value \"abc\" did not match the regex"))
        end

        context 'with a valid uuid' do
          let(:restaurant_id) { 'c5ce6ee3-c4b9-4604-ab0a-1baa45253825' }

          it 'is valid' do
            expect(subject.errors['data']).to be_empty
          end
        end
      end
    end
  end

  describe 'instance methods' do
    describe '#hotel?' do
      it { expect(subject.hotel?).to eq false }

      context 'when it is a hotel review' do
        before { subject.data = { 'hotel_id' => 1 } }

        it { expect(subject.hotel?).to eq true }
      end
    end

    describe '#restaurant?' do
      it { expect(subject.restaurant?).to eq false }

      context 'when it is a restaurant review' do
        before { subject.data = { 'restaurant_id' => 1 } }

        it { expect(subject.restaurant?).to eq true }
      end
    end
  end
end
