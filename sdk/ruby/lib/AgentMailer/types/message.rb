# frozen_string_literal: true

module AgentMailer
  module Types
    class Message < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

      field :thread_id, -> { String }, optional: false, nullable: false, api_name: "threadId"

      field :direction, -> { AgentMailer::Types::MessageDirection }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::MessageStatus }, optional: false, nullable: false

      field :from, -> { AgentMailer::Types::MessageFrom }, optional: false, nullable: false

      field :to, -> { Internal::Types::Array[AgentMailer::Types::MessageToItem] }, optional: false, nullable: false

      field :cc, -> { Internal::Types::Array[AgentMailer::Types::MessageCcItem] }, optional: false, nullable: false

      field :bcc, -> { Internal::Types::Array[AgentMailer::Types::MessageBccItem] }, optional: false, nullable: false

      field :reply_to, -> { Internal::Types::Array[AgentMailer::Types::MessageReplyToItem] }, optional: false, nullable: false, api_name: "replyTo"

      field :subject, -> { String }, optional: false, nullable: false

      field :text, -> { String }, optional: false, nullable: true

      field :html, -> { String }, optional: false, nullable: true

      field :extracted_text, -> { String }, optional: false, nullable: true, api_name: "extractedText"

      field :extracted_html, -> { String }, optional: false, nullable: true, api_name: "extractedHtml"

      field :headers, -> { Internal::Types::Hash[String, String] }, optional: false, nullable: false

      field :in_reply_to, -> { String }, optional: false, nullable: true, api_name: "inReplyTo"

      field :references, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :attachments, -> { Internal::Types::Array[AgentMailer::Types::MessageAttachmentsItem] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :sent_at, -> { String }, optional: false, nullable: true, api_name: "sentAt"

      field :received_at, -> { String }, optional: false, nullable: true, api_name: "receivedAt"
    end
  end
end
