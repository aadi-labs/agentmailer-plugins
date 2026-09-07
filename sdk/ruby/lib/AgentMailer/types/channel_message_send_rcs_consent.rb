# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendRcsConsent < Internal::Types::Model
      field :basis, -> { AgentMailer::Types::ChannelMessageSendRcsConsentBasis }, optional: false, nullable: false

      field :captured_at, -> { String }, optional: false, nullable: false, api_name: "capturedAt"

      field :reference, -> { String }, optional: false, nullable: false
    end
  end
end
