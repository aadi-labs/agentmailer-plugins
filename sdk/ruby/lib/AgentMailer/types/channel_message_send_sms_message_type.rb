# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSendSmsMessageType
      extend AgentMailer::Internal::Types::Enum

      TRANSACTIONAL = "transactional"
      PROMOTIONAL = "promotional"
    end
  end
end
