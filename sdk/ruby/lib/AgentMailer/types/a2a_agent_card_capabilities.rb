# frozen_string_literal: true

module AgentMailer
  module Types
    class A2AAgentCardCapabilities < Internal::Types::Model
      field :streaming, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :push_notifications, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "pushNotifications"

      field :extended_agent_card, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "extendedAgentCard"
    end
  end
end
