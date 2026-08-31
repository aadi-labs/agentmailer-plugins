# frozen_string_literal: true

module AgentMailer
  module Types
    module DomainStatus
      extend AgentMailer::Internal::Types::Enum

      PENDING = "pending"
      VERIFIED = "verified"
      FAILED = "failed"
    end
  end
end
