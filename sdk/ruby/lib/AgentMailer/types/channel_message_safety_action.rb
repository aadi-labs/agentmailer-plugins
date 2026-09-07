# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSafetyAction
      extend AgentMailer::Internal::Types::Enum

      ALLOW = "allow"
      HOLD = "hold"
    end
  end
end
