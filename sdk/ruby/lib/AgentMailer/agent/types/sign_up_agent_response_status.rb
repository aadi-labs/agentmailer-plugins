# frozen_string_literal: true

module AgentMailer
  module Agent
    module Types
      module SignUpAgentResponseStatus
        extend AgentMailer::Internal::Types::Enum

        PENDING_HUMAN_APPROVAL = "pending_human_approval"
      end
    end
  end
end
