# frozen_string_literal: true

module AgentMailer
  module ChannelEndpoints
    module Types
      module ChannelEndpointUpdateStatus
        extend AgentMailer::Internal::Types::Enum

        ACTIVE = "active"
        DISABLED = "disabled"
      end
    end
  end
end
