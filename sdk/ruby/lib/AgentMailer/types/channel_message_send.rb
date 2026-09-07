# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSend < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      discriminant :channel

      member -> { AgentMailer::Types::ChannelMessageSendSms }, key: "SMS"

      member -> { AgentMailer::Types::ChannelMessageSendMms }, key: "MMS"

      member -> { AgentMailer::Types::ChannelMessageSendRcs }, key: "RCS"

      member -> { AgentMailer::Types::ChannelMessageSendWhatsapp }, key: "WHATSAPP"

      member -> { AgentMailer::Types::ChannelMessageSendVoice }, key: "VOICE"
    end
  end
end
