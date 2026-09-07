# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageDirection
      extend AgentMailer::Internal::Types::Enum

      INBOUND = "inbound"
      OUTBOUND = "outbound"
    end
  end
end
