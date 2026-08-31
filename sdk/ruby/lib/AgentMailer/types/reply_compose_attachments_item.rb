# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyComposeAttachmentsItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { AgentMailer::Types::ReplyComposeAttachmentsItemContent }

      member -> { AgentMailer::Types::ReplyComposeAttachmentsItemAttachmentID }
    end
  end
end
