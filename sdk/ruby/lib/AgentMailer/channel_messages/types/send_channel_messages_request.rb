# frozen_string_literal: true

module AgentMailer
  module ChannelMessages
    module Types
      class SendChannelMessagesRequest < Internal::Types::Model
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"

        field :body, -> { AgentMailer::Types::ChannelMessageSend }, optional: false, nullable: false
      end
    end
  end
end
