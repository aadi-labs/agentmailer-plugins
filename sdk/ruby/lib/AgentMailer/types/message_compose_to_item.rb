# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageComposeToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageComposeToItemAddress }
    end
  end
end
