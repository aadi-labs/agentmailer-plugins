# frozen_string_literal: true

module AgentMailer
  module Messages
    module Types
      class ReplyMessagesRequest < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :body, -> { AgentMailer::Types::ReplyCompose }, optional: false, nullable: false
      end
    end
  end
end
