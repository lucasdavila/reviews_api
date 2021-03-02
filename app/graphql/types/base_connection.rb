# frozen_string_literal: true

module Types
  # this generated class, is creating a kind of circular reference error on specs.
  # so I reimplemented it, as documented on: https://graphql-ruby.org/api-doc/1.9.6/GraphQL/Types/Relay/BaseConnection.html

  # class BaseConnection < Types::BaseObject
  #   # add `nodes` and `pageInfo` fields, as well as `edge_type(...)` and `node_nullable(...)` overrides
  #   include GraphQL::Types::Relay::ConnectionBehaviors
  # end

  class BaseConnection < GraphQL::Types::Relay::BaseConnection; end
end
