# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelRecipientPermission < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :channel, -> { AgentMailer::Types::ChannelRecipientPermissionChannel }, optional: false, nullable: false

      field :recipient, -> { String }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::ChannelRecipientPermissionStatus }, optional: false, nullable: false

      field :consent_basis, -> { AgentMailer::Types::ChannelRecipientPermissionConsentBasis }, optional: false, nullable: true, api_name: "consentBasis"

      field :consent_reference, -> { String }, optional: false, nullable: true, api_name: "consentReference"

      field :consent_captured_at, -> { String }, optional: false, nullable: true, api_name: "consentCapturedAt"

      field :opted_out_at, -> { String }, optional: false, nullable: true, api_name: "optedOutAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
