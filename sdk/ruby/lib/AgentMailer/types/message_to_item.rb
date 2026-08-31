# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageToItemAddress }
    end
  end
end
