# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftReplyToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::DraftReplyToItemAddress }
    end
  end
end
