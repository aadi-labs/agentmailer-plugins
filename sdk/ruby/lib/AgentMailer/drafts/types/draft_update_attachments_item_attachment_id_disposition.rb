# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      module DraftUpdateAttachmentsItemAttachmentIDDisposition
        extend AgentMailer::Internal::Types::Enum

        ATTACHMENT = "attachment"
        INLINE = "inline"
      end
    end
  end
end
