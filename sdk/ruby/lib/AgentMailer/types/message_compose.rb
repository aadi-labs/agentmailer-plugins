# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageCompose < Internal::Types::Model
      field :to, -> { Internal::Types::Array[AgentMailer::Types::MessageComposeToItem] }, optional: false, nullable: false

      field :cc, -> { Internal::Types::Array[AgentMailer::Types::MessageComposeCcItem] }, optional: true, nullable: false

      field :bcc, -> { Internal::Types::Array[AgentMailer::Types::MessageComposeBccItem] }, optional: true, nullable: false

      field :reply_to, -> { Internal::Types::Array[AgentMailer::Types::MessageComposeReplyToItem] }, optional: true, nullable: false, api_name: "replyTo"

      field :subject, -> { String }, optional: true, nullable: false

      field :text, -> { String }, optional: true, nullable: false

      field :html, -> { String }, optional: true, nullable: false

      field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

      field :attachments, -> { Internal::Types::Array[AgentMailer::Types::MessageComposeAttachmentsItem] }, optional: true, nullable: false
    end
  end
end
