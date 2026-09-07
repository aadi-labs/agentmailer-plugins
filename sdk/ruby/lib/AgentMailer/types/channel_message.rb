# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessage < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :conversation_id, -> { String }, optional: false, nullable: false, api_name: "conversationId"

      field :channel, -> { AgentMailer::Types::ChannelMessageChannel }, optional: false, nullable: false

      field :direction, -> { AgentMailer::Types::ChannelMessageDirection }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::ChannelMessageStatus }, optional: false, nullable: false

      field :from, -> { String }, optional: false, nullable: false

      field :to, -> { String }, optional: false, nullable: false

      field :text, -> { String }, optional: false, nullable: true

      field :media_urls, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "mediaUrls"

      field :attachment_ids, -> { Internal::Types::Array[Object] }, optional: false, nullable: false, api_name: "attachmentIds"

      field :provider_message_id, -> { String }, optional: false, nullable: true, api_name: "providerMessageId"

      field :failure_code, -> { String }, optional: false, nullable: true, api_name: "failureCode"

      field :safety, -> { AgentMailer::Types::ChannelMessageSafety }, optional: false, nullable: true

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :sent_at, -> { String }, optional: false, nullable: true, api_name: "sentAt"

      field :received_at, -> { String }, optional: false, nullable: true, api_name: "receivedAt"
    end
  end
end
