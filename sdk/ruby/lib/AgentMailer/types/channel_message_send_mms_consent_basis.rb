# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelMessageSendMmsConsentBasis
      extend AgentMailer::Internal::Types::Enum

      EXPLICIT = "explicit"
      TRANSACTIONAL_RELATIONSHIP = "transactional_relationship"
    end
  end
end
