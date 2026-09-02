# frozen_string_literal: true

module AgentMailer
  module Types
    class BillingAccount < Internal::Types::Model
      field :plan, -> { AgentMailer::Types::BillingAccountPlan }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::BillingAccountStatus }, optional: false, nullable: false

      field :current_period_end, -> { String }, optional: false, nullable: true, api_name: "currentPeriodEnd"

      field :inbox_limit, -> { Integer }, optional: false, nullable: true, api_name: "inboxLimit"

      field :monthly_send_limit, -> { Integer }, optional: false, nullable: true, api_name: "monthlySendLimit"

      field :custom_domain_limit, -> { Integer }, optional: false, nullable: true, api_name: "customDomainLimit"

      field :billing_interval, -> { AgentMailer::Types::BillingAccountBillingInterval }, optional: false, nullable: true, api_name: "billingInterval"
    end
  end
end
