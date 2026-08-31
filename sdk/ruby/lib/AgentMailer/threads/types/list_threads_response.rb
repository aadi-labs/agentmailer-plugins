# frozen_string_literal: true

module AgentMailer
  module Threads
    module Types
      class ListThreadsResponse < Internal::Types::Model
        field :threads, -> { Internal::Types::Array[AgentMailer::Types::Thread] }, optional: false, nullable: false

        field :next_page_token, -> { String }, optional: true, nullable: false, api_name: "nextPageToken"
      end
    end
  end
end
