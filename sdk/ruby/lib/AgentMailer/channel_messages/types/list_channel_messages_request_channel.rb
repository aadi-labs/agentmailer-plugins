# frozen_string_literal: true

module AgentMailer
  module ChannelMessages
    module Types
      module ListChannelMessagesRequestChannel
        extend AgentMailer::Internal::Types::Enum

        SMS = "sms"
        MMS = "mms"
        RCS = "rcs"
        WHATSAPP = "whatsapp"
        VOICE = "voice"
      end
    end
  end
end
