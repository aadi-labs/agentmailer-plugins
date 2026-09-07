# frozen_string_literal: true

module AgentMailer
  module ChannelConversations
    module Types
      class ListChannelConversationsResponse < Internal::Types::Model
        field :conversations, -> { Internal::Types::Array[AgentMailer::Types::ChannelConversation] }, optional: false, nullable: false

        field :next_page_token, -> { String }, optional: false, nullable: false, api_name: "nextPageToken"
      end
    end
  end
end
