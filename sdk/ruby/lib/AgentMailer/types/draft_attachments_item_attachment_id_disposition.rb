# frozen_string_literal: true

module AgentMailer
  module Types
    module DraftAttachmentsItemAttachmentIDDisposition
      extend AgentMailer::Internal::Types::Enum

      ATTACHMENT = "attachment"
      INLINE = "inline"
    end
  end
end
