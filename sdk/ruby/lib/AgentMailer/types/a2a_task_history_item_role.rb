# frozen_string_literal: true

module AgentMailer
  module Types
    module A2ATaskHistoryItemRole
      extend AgentMailer::Internal::Types::Enum

      ROLE_USER = "ROLE_USER"
      ROLE_AGENT = "ROLE_AGENT"
    end
  end
end
