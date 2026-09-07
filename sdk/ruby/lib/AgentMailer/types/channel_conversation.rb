# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelConversation < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :channel, -> { AgentMailer::Types::ChannelConversationChannel }, optional: false, nullable: false

      field :remote_address, -> { String }, optional: false, nullable: false, api_name: "remoteAddress"

      field :status, -> { AgentMailer::Types::ChannelConversationStatus }, optional: false, nullable: false

      field :message_count, -> { Integer }, optional: false, nullable: false, api_name: "messageCount"

      field :last_message_at, -> { String }, optional: false, nullable: false, api_name: "lastMessageAt"

      field :last_inbound_at, -> { String }, optional: false, nullable: true, api_name: "lastInboundAt"

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
