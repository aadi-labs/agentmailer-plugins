# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      module A2ATaskUpdateMessageRole
        extend AgentMailer::Internal::Types::Enum

        ROLE_USER = "ROLE_USER"
        ROLE_AGENT = "ROLE_AGENT"
      end
    end
  end
end
