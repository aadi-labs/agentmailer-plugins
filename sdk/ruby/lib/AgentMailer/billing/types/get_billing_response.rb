# frozen_string_literal: true

module AgentMailer
  module Billing
    module Types
      class GetBillingResponse < Internal::Types::Model
        field :billing, -> { AgentMailer::Types::BillingAccount }, optional: false, nullable: false
      end
    end
  end
end
