# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdateAttachmentsItemAttachmentID < Internal::Types::Model
        field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"

        field :content_id, -> { String }, optional: true, nullable: false, api_name: "contentId"

        field :disposition, -> { AgentMailer::Drafts::Types::DraftUpdateAttachmentsItemAttachmentIDDisposition }, optional: true, nullable: false
      end
    end
  end
end
