# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsapp < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :to, -> { String }, optional: false, nullable: false

      field :consent, -> { AgentMailer::Types::ChannelMessageSendWhatsappConsent }, optional: false, nullable: false

      field :content, -> { AgentMailer::Types::ChannelMessageSendWhatsappContent }, optional: false, nullable: false
    end
  end
end
