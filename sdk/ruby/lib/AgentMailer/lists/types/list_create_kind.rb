# frozen_string_literal: true

module AgentMailer
  module Lists
    module Types
      module ListCreateKind
        extend AgentMailer::Internal::Types::Enum

        ALLOW = "allow"
        BLOCK = "block"
      end
    end
  end
end
