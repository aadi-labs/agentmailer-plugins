# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftCreateAttachmentsItemAttachmentID < Internal::Types::Model
        field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"

        field :content_id, -> { String }, optional: true, nullable: false, api_name: "contentId"

        field :disposition, -> { AgentMailer::Drafts::Types::DraftCreateAttachmentsItemAttachmentIDDisposition }, optional: true, nullable: false
      end
    end
  end
end
