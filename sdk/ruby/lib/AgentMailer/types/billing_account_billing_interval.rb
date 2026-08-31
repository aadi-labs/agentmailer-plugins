# frozen_string_literal: true

module AgentMailer
  module Types
    module BillingAccountBillingInterval
      extend AgentMailer::Internal::Types::Enum

      MONTH = "month"
      YEAR = "year"
    end
  end
end
