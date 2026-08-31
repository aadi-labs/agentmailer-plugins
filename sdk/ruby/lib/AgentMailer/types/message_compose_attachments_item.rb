# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageComposeAttachmentsItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { AgentMailer::Types::MessageComposeAttachmentsItemContent }

      member -> { AgentMailer::Types::MessageComposeAttachmentsItemAttachmentID }
    end
  end
end
