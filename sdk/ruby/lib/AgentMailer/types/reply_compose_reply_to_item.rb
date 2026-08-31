# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyComposeReplyToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::ReplyComposeReplyToItemAddress }
    end
  end
end
