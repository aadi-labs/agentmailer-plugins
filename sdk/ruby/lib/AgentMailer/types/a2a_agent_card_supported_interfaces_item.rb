# frozen_string_literal: true

module AgentMailer
  module Types
    class A2AAgentCardSupportedInterfacesItem < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false

      field :protocol_binding, -> { AgentMailer::Types::A2AAgentCardSupportedInterfacesItemProtocolBinding }, optional: false, nullable: false, api_name: "protocolBinding"

      field :protocol_version, -> { AgentMailer::Types::A2AAgentCardSupportedInterfacesItemProtocolVersion }, optional: false, nullable: false, api_name: "protocolVersion"
    end
  end
end
