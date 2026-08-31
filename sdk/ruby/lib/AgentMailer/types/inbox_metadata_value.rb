# frozen_string_literal: true

module AgentMailer
  module Types
    class InboxMetadataValue < Internal::Types::Model
      extend AgentMailer::Internal::Types::Union

      member -> { String }

      member -> { Integer }

      member -> { Internal::Types::Boolean }
    end
  end
end
