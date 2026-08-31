# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftBccItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::DraftBccItemAddress }
    end
  end
end
