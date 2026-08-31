# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageReplyToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageReplyToItemAddress }
    end
  end
end
