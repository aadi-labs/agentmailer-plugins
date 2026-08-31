# frozen_string_literal: true

module AgentMailer
  module Webhooks
    module Types
      class ListWebhooksResponse < Internal::Types::Model
        field :webhooks, -> { Internal::Types::Array[AgentMailer::Types::Webhook] }, optional: false, nullable: false
      end
    end
  end
end
