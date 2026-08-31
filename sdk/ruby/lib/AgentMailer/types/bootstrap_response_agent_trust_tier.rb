# frozen_string_literal: true

module AgentMailer
  module Types
    module BootstrapResponseAgentTrustTier
      extend AgentMailer::Internal::Types::Enum

      BOOTSTRAP = "bootstrap"
      VERIFIED = "verified"
      ESTABLISHED = "established"
    end
  end
end
