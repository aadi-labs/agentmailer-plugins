# frozen_string_literal: true

module AgentMailer
  module Types
    module MessageDirection
      extend AgentMailer::Internal::Types::Enum

      INBOUND = "inbound"
      OUTBOUND = "outbound"
    end
  end
end
