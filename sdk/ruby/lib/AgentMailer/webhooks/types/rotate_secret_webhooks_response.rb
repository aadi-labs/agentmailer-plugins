# frozen_string_literal: true

module AgentMailer
  module Webhooks
    module Types
      class RotateSecretWebhooksResponse < Internal::Types::Model
        field :secret, -> { String }, optional: false, nullable: false
      end
    end
  end
end
