# frozen_string_literal: true

module AgentMailer
  module Types
    module ListKind
      extend AgentMailer::Internal::Types::Enum

      ALLOW = "allow"
      BLOCK = "block"
    end
  end
end
