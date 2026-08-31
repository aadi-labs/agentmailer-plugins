# frozen_string_literal: true

module AgentMailer
  module Types
    module BillingAccountStatus
      extend AgentMailer::Internal::Types::Enum

      ACTIVE = "active"
      TRIALING = "trialing"
      PAST_DUE = "past_due"
      PAUSED = "paused"
      CANCELED = "canceled"
      UNPAID = "unpaid"
    end
  end
end
