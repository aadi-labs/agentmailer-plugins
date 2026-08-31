# frozen_string_literal: true

module AgentMailer
  module Billing
    module Types
      module BillingSelectionInterval
        extend AgentMailer::Internal::Types::Enum

        MONTH = "month"
        YEAR = "year"
      end
    end
  end
end
