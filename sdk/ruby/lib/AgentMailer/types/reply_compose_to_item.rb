# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyComposeToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::ReplyComposeToItemAddress }
    end
  end
end
