# frozen_string_literal: true

module AgentMailer
  module Types
    module InboxStatus
      extend AgentMailer::Internal::Types::Enum

      PROVISIONING = "provisioning"
      ACTIVE = "active"
      FAILED = "failed"
    end
  end
end
