# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2AJsonRpcRequest < Internal::Types::Model
        field :handle, -> { String }, optional: false, nullable: false

        field :jsonrpc, -> { AgentMailer::A2A::Types::A2AJsonRpcRequestJsonrpc }, optional: false, nullable: false

        field :id, -> { AgentMailer::A2A::Types::A2AJsonRpcRequestId }, optional: false, nullable: true

        field :method_, -> { String }, optional: false, nullable: false, api_name: "method"

        field :params, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
      end
    end
  end
end
