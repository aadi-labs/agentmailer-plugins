# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelConversationChannel
      extend AgentMailer::Internal::Types::Enum

      SMS = "sms"
      MMS = "mms"
      RCS = "rcs"
      WHATSAPP = "whatsapp"
      VOICE = "voice"
    end
  end
end
