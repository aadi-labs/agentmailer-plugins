# frozen_string_literal: true

module AgentMailer
  module Types
    module BillingAccountPlan
      extend AgentMailer::Internal::Types::Enum

      FREE = "free"
      DEVELOPER = "developer"
      STARTUP = "startup"
      ENTERPRISE = "enterprise"
    end
  end
end
