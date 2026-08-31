# frozen_string_literal: true

module AgentMailer
  module Types
    module ReplyComposeAttachmentsItemAttachmentIDDisposition
      extend AgentMailer::Internal::Types::Enum

      ATTACHMENT = "attachment"
      INLINE = "inline"
    end
  end
end
