# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateAttachmentsItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { AgentMailer::Drafts::Types::DraftUpdateAttachmentsItemContent }

        member -> { AgentMailer::Drafts::Types::DraftUpdateAttachmentsItemAttachmentID }
      end
    end
  end
end
