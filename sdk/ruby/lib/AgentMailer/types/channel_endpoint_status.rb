# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelEndpointStatus
      extend AgentMailer::Internal::Types::Enum

      PROVISIONING = "provisioning"
      ACTIVE = "active"
      DISABLED = "disabled"
      FAILED = "failed"
    end
  end
end
