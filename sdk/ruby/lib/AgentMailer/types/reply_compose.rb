# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyCompose < Internal::Types::Model
      field :to, -> { Internal::Types::Array[AgentMailer::Types::ReplyComposeToItem] }, optional: true, nullable: false

      field :cc, -> { Internal::Types::Array[AgentMailer::Types::ReplyComposeCcItem] }, optional: true, nullable: false

      field :bcc, -> { Internal::Types::Array[AgentMailer::Types::ReplyComposeBccItem] }, optional: true, nullable: false

      field :reply_to, -> { Internal::Types::Array[AgentMailer::Types::ReplyComposeReplyToItem] }, optional: true, nullable: false, api_name: "replyTo"

      field :subject, -> { String }, optional: true, nullable: false

      field :text, -> { String }, optional: true, nullable: false

      field :html, -> { String }, optional: true, nullable: false

      field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :attachments, -> { Internal::Types::Array[AgentMailer::Types::ReplyComposeAttachmentsItem] }, optional: true, nullable: false
    end
  end
end
