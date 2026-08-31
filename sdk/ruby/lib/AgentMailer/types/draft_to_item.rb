# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftToItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::DraftToItemAddress }
    end
  end
end
