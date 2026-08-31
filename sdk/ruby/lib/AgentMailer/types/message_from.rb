# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageFrom < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageFromAddress }
    end
  end
end
