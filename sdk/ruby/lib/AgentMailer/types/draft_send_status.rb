# frozen_string_literal: true

module AgentMailer
  module Types
    module DraftSendStatus
      extend AgentMailer::Internal::Types::Enum

      SCHEDULED = "scheduled"
      SENDING = "sending"
      FAILED = "failed"
    end
  end
end
