# frozen_string_literal: true

module AgentMailer
  module Billing
    module Types
      class CreatePortalBillingResponse < Internal::Types::Model
        field :url, -> { String }, optional: false, nullable: false
      end
    end
  end
end
