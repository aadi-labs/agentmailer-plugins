# frozen_string_literal: true

module AgentMailer
  module Billing
    module Types
      class BillingSelection < Internal::Types::Model
        field :inboxes, -> { Integer }, optional: true, nullable: false

        field :monthly_messages, -> { Integer }, optional: true, nullable: false, api_name: "monthlyMessages"

        field :custom_domains, -> { Integer }, optional: true, nullable: false, api_name: "customDomains"

        field :interval, -> { AgentMailer::Billing::Types::BillingSelectionInterval }, optional: true, nullable: false
      end
    end
  end
end
