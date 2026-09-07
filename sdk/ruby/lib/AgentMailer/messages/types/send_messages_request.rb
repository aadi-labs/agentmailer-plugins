# frozen_string_literal: true

module AgentMailer
  module Messages
    module Types
      class SendMessagesRequest < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :body, -> { AgentMailer::Types::MessageCompose }, optional: false, nullable: false
      end
    end
  end
end
