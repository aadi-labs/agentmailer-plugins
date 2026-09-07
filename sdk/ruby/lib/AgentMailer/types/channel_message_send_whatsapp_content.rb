# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsappContent < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      discriminant :type

      member -> { AgentMailer::Types::ChannelMessageSendWhatsappContentText }, key: "TEXT"

      member -> { AgentMailer::Types::ChannelMessageSendWhatsappContentTemplate }, key: "TEMPLATE"

      member -> { AgentMailer::Types::ChannelMessageSendWhatsappContentMedia }, key: "MEDIA"

      member -> { AgentMailer::Types::ChannelMessageSendWhatsappContentButtons }, key: "BUTTONS"
    end
  end
end
