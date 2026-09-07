# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSafetyRisk
      extend AgentMailer::Internal::Types::Enum

      LOW = "low"
      MEDIUM = "medium"
      HIGH = "high"
      UNKNOWN = "unknown"
    end
  end
end
