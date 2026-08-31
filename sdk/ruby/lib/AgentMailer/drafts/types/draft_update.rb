# frozen_string_literal: true

module AgentMailer
  module Drafts
    module Types
      class DraftUpdate < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :draft_id, -> { String }, optional: false, nullable: false, api_name: "draftId"

        field :to, -> { Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateToItem] }, optional: true, nullable: false

        field :cc, -> { Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateCcItem] }, optional: true, nullable: false

        field :bcc, -> { Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateBccItem] }, optional: true, nullable: false

        field :reply_to, -> { Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateReplyToItem] }, optional: true, nullable: false, api_name: "replyTo"

        field :subject, -> { String }, optional: true, nullable: false

        field :text, -> { String }, optional: true, nullable: false

        field :html, -> { String }, optional: true, nullable: false

        field :headers, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false

        field :attachments, -> { Internal::Types::Array[AgentMailer::Drafts::Types::DraftUpdateAttachmentsItem] }, optional: true, nullable: false

        field :reply_to_message_id, -> { String }, optional: true, nullable: false, api_name: "replyToMessageId"

        field :forward_message_id, -> { String }, optional: true, nullable: false, api_name: "forwardMessageId"

        field :send_at, -> { String }, optional: true, nullable: false, api_name: "sendAt"
      end
    end
  end
end
