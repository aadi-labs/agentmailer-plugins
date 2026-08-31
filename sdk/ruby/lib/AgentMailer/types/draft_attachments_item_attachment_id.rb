# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftAttachmentsItemAttachmentID < Internal::Types::Model
      field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"

      field :content_id, -> { String }, optional: true, nullable: false, api_name: "contentId"

      field :disposition, -> { AgentMailer::Types::DraftAttachmentsItemAttachmentIDDisposition }, optional: false, nullable: false
    end
  end
end
