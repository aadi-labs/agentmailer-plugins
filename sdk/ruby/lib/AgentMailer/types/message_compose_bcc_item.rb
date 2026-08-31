# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageComposeBccItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageComposeBccItemAddress }
    end
  end
end
