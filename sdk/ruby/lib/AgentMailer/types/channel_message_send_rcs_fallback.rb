# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSendRcsFallback
      extend AgentMailer::Internal::Types::Enum

      NONE = "none"
      SMS = "sms"
    end
  end
end
