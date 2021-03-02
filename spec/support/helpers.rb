# frozen_string_literal: true

module Helpers
  def response_data
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
