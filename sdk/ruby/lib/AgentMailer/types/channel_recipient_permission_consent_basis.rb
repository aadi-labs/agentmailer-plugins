# frozen_string_literal: true

module AgentMailer
  module Types
    module ChannelRecipientPermissionConsentBasis
      extend AgentMailer::Internal::Types::Enum

      EXPLICIT = "explicit"
      TRANSACTIONAL_RELATIONSHIP = "transactional_relationship"
      INBOUND_KEYWORD = "inbound_keyword"
    end
  end
end
