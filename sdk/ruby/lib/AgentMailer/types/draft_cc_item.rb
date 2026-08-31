# frozen_string_literal: true

module AgentMailer
  module Types
    class DraftCcItem < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { AgentMailer::Types::DraftCcItemAddress }
    end
  end
end
