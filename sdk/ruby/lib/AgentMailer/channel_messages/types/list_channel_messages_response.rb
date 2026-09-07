# frozen_string_literal: true

module AgentMailer
  module ChannelMessages
    module Types
      class ListChannelMessagesResponse < Internal::Types::Model
        field :messages, -> { Internal::Types::Array[AgentMailer::Types::ChannelMessage] }, optional: false, nullable: false

        field :next_page_token, -> { String }, optional: false, nullable: false, api_name: "nextPageToken"
      end
    end
  end
end
