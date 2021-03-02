# frozen_string_literal: true

module Helpers
  def response_data
    JSON.parse(response.body)
  end

  def headers
    { 'HTTP_API_KEY' => Rails.configuration.auth[:api_key] }
  end
end

RSpec.configure do |config|
  config.include Helpers
end
