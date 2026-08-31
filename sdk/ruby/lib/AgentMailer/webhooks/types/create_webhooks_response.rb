# frozen_string_literal: true

module AgentMailer
  module Webhooks
    module Types
      class CreateWebhooksResponse < Internal::Types::Model
        field :webhook, -> { AgentMailer::Types::Webhook }, optional: false, nullable: false

        field :secret, -> { String }, optional: false, nullable: false
      end
    end
  end
end
