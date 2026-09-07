# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSendVoiceTextType
      extend AgentMailer::Internal::Types::Enum

      TEXT = "text"
      SSML = "ssml"
    end
  end
end
