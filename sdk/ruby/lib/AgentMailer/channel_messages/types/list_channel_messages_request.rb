# frozen_string_literal: true

module AgentMailer
  module ChannelMessages
    module Types
      class ListChannelMessagesRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :page_token, -> { String }, optional: true, nullable: false, api_name: "pageToken"

        field :endpoint_id, -> { String }, optional: true, nullable: false, api_name: "endpointId"

        field :conversation_id, -> { String }, optional: true, nullable: false, api_name: "conversationId"

        field :channel, -> { AgentMailer::ChannelMessages::Types::ListChannelMessagesRequestChannel }, optional: true, nullable: false
      end
    end
  end
end
