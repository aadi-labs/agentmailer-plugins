# frozen_string_literal: true

module AgentMailer
  module Types
    class Draft < Internal::Types::Model
      field :to, -> { Internal::Types::Array[AgentMailer::Types::DraftToItem] }, optional: false, nullable: false

      field :cc, -> { Internal::Types::Array[AgentMailer::Types::DraftCcItem] }, optional: true, nullable: false

      field :bcc, -> { Internal::Types::Array[AgentMailer::Types::DraftBccItem] }, optional: true, nullable: false

      field :reply_to, -> { Internal::Types::Array[AgentMailer::Types::DraftReplyToItem] }, optional: true, nullable: false, api_name: "replyTo"

      field :subject, -> { String }, optional: true, nullable: false

      field :text, -> { String }, optional: true, nullable: false

      field :html, -> { String }, optional: true, nullable: false

      field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :attachments, -> { Internal::Types::Array[AgentMailer::Types::DraftAttachmentsItem] }, optional: false, nullable: false

      field :reply_to_message_id, -> { String }, optional: true, nullable: false, api_name: "replyToMessageId"

      field :forward_message_id, -> { String }, optional: true, nullable: false, api_name: "forwardMessageId"

      field :send_at, -> { String }, optional: true, nullable: false, api_name: "sendAt"

      field :id, -> { String }, optional: false, nullable: false

      field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"

      field :send_status, -> { AgentMailer::Types::DraftSendStatus }, optional: false, nullable: true, api_name: "sendStatus"
    end
  end
end
