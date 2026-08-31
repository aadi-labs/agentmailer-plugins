# frozen_string_literal: true

module AgentMailer
  module Types
    class MailProtocolEndpoint < Internal::Types::Model
      field :host, -> { String }, optional: false, nullable: false

      field :port, -> { Integer }, optional: false, nullable: false

      field :security, -> { AgentMailer::Types::MailProtocolEndpointSecurity }, optional: false, nullable: false
    end
  end
end
