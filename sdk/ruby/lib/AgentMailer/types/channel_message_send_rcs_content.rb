# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendRcsContent < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      discriminant :type

      member -> { AgentMailer::Types::ChannelMessageSendRcsContentText }, key: "TEXT"

      member -> { AgentMailer::Types::ChannelMessageSendRcsContentRichCard }, key: "RICH_CARD"
    end
  end
end
