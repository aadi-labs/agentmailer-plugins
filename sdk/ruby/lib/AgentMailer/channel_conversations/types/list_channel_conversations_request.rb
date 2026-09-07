# frozen_string_literal: true

module AgentMailer
  module ChannelConversations
    module Types
      class ListChannelConversationsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :page_token, -> { String }, optional: true, nullable: false, api_name: "pageToken"

        field :endpoint_id, -> { String }, optional: true, nullable: false, api_name: "endpointId"

        field :channel, -> { AgentMailer::ChannelConversations::Types::ListChannelConversationsRequestChannel }, optional: true, nullable: false

        field :status, -> { AgentMailer::ChannelConversations::Types::ListChannelConversationsRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
