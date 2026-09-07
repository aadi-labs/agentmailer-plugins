# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendMms < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :to, -> { String }, optional: false, nullable: false

      field :consent, -> { AgentMailer::Types::ChannelMessageSendMmsConsent }, optional: false, nullable: false

      field :content, -> { AgentMailer::Types::ChannelMessageSendMmsContent }, optional: true, nullable: false

      field :attachment_ids, -> { Internal::Types::Array[Object] }, optional: false, nullable: false, api_name: "attachmentIds"
    end
  end
end
