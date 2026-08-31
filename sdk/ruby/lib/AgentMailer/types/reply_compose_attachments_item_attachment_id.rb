# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyComposeAttachmentsItemAttachmentID < Internal::Types::Model
      field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"

      field :content_id, -> { String }, optional: true, nullable: false, api_name: "contentId"

      field :disposition, -> { AgentMailer::Types::ReplyComposeAttachmentsItemAttachmentIDDisposition }, optional: true, nullable: false
    end
  end
end
