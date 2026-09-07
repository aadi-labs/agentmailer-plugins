# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSendVoiceConsentBasis
      extend AgentMailer::Internal::Types::Enum

      EXPLICIT = "explicit"
      TRANSACTIONAL_RELATIONSHIP = "transactional_relationship"
    end
  end
end
