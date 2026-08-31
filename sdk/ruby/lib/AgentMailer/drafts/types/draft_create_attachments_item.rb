# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftCreateAttachmentsItem < Internal::Types::Model
        extend AgentMailer::Internal::Types::Union

        member -> { AgentMailer::Drafts::Types::DraftCreateAttachmentsItemContent }

        member -> { AgentMailer::Drafts::Types::DraftCreateAttachmentsItemAttachmentID }
      end
    end
  end
end
