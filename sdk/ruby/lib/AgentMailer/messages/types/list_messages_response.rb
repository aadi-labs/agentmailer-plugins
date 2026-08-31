# frozen_string_literal: true

module AgentMailer
  module Messages
    module Types
      class ListMessagesResponse < Internal::Types::Model
        field :messages, -> { Internal::Types::Array[AgentMailer::Types::Message] }, optional: false, nullable: false

        field :next_page_token, -> { String }, optional: true, nullable: false, api_name: "nextPageToken"
      end
    end
  end
end
