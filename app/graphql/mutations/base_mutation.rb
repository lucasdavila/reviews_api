# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def model_errors(model)
      GraphQL::ExecutionError.new("Error on save #{model.class}: #{model.errors.full_messages.join(', ')}")
    end
  end
end
