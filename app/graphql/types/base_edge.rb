# frozen_string_literal: true

module Types
  # this generated class, is creating a kind of circular reference error on specs.
  # so I reimplemented it, as documented on: https://graphql-ruby.org/api-doc/1.9.6/GraphQL/Types/Relay/BaseEdge.html
  #
  # class BaseEdge < Types::BaseObject
  #   # add `node` and `cursor` fields, as well as `node_type(...)` override
  #   include GraphQL::Types::Relay::EdgeBehaviors
  # end

  class BaseEdge < GraphQL::Types::Relay::BaseEdge; end
end
