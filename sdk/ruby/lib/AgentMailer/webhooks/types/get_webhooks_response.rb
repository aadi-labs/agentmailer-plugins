# frozen_string_literal: true

module AgentMailer
  module Webhooks
    module Types
      class GetWebhooksResponse < Internal::Types::Model
        field :webhook, -> { AgentMailer::Types::Webhook }, optional: false, nullable: false
      end
    end
  end
end
