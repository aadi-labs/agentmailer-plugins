# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelConversationStatus
      extend AgentMailer::Internal::Types::Enum

      ACTIVE = "active"
      CLOSED = "closed"
    end
  end
end
