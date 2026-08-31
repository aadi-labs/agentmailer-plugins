# frozen_string_literal: true

module AgentMailer
  module Types
    module WebhookStatus
      extend AgentMailer::Internal::Types::Enum

      ENABLED = "enabled"
      DISABLED = "disabled"
    end
  end
end
