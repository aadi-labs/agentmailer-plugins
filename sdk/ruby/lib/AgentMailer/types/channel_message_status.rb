# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageStatus
      extend AgentMailer::Internal::Types::Enum

      QUEUED = "queued"
      SENT = "sent"
      DELIVERED = "delivered"
      READ = "read"
      FAILED = "failed"
      RECEIVED = "received"
      BLOCKED = "blocked"
    end
  end
end
