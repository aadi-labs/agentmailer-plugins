# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageBccItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageBccItemAddress }
    end
  end
end
