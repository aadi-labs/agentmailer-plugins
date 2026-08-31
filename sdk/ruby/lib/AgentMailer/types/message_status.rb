# frozen_string_literal: true

module AgentMailer
  module Types
    module MessageStatus
      extend AgentMailer::Internal::Types::Enum

      QUEUED = "queued"
      SENT = "sent"
      DELIVERED = "delivered"
      BOUNCED = "bounced"
      COMPLAINED = "complained"
      REJECTED = "rejected"
      RECEIVED = "received"
    end
  end
end
