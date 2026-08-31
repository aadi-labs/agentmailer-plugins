# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageCcItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageCcItemAddress }
    end
  end
end
