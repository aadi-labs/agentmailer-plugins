# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendRcs < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :to, -> { String }, optional: false, nullable: false

      field :consent, -> { AgentMailer::Types::ChannelMessageSendRcsConsent }, optional: false, nullable: false

      field :content, -> { AgentMailer::Types::ChannelMessageSendRcsContent }, optional: false, nullable: false

      field :fallback, -> { AgentMailer::Types::ChannelMessageSendRcsFallback }, optional: true, nullable: false
    end
  end
end
