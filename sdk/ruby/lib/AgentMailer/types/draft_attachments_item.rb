# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftAttachmentsItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { AgentMailer::Types::DraftAttachmentsItemContent }

      member -> { AgentMailer::Types::DraftAttachmentsItemAttachmentID }
    end
  end
end
