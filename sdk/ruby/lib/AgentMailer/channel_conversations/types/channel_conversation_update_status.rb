# frozen_string_literal: true

module AgentMailer
  module ChannelConversations
    module Types
      module ChannelConversationUpdateStatus
        extend AgentMailer::Internal::Types::Enum

        ACTIVE = "active"
        CLOSED = "closed"
      end
    end
  end
end
