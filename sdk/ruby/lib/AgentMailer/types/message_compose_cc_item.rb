# frozen_string_literal: true

module AgentMailer
  module Types
    class MessageComposeCcItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::MessageComposeCcItemAddress }
    end
  end
end
