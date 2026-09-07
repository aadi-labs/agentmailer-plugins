# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSendWhatsappContentMediaKind
      extend AgentMailer::Internal::Types::Enum

      IMAGE = "image"
      VIDEO = "video"
      AUDIO = "audio"
      DOCUMENT = "document"
    end
  end
end
