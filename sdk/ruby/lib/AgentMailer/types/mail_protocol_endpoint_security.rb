# frozen_string_literal: true

module AgentMailer
  module Types
    module MailProtocolEndpointSecurity
      extend AgentMailer::Internal::Types::Enum

      TLS = "tls"
      STARTTLS = "starttls"
    end
  end
end
