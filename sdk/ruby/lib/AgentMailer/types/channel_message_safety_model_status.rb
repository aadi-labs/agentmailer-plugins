# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSafetyModelStatus
      extend AgentMailer::Internal::Types::Enum

      NOT_CONFIGURED = "not_configured"
      SKIPPED = "skipped"
      COMPLETED = "completed"
      UNAVAILABLE = "unavailable"
    end
  end
end
