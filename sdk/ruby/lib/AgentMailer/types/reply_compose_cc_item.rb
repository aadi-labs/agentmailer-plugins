# frozen_string_literal: true

module AgentMailer
  module Types
    class ReplyComposeCcItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::ReplyComposeCcItemAddress }
    end
  end
end
