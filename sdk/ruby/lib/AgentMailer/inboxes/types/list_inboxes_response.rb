# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class ListInboxesResponse < Internal::Types::Model
        field :inboxes, -> { Internal::Types::Array[AgentMailer::Types::Inbox] }, optional: false, nullable: false

        field :next_page_token, -> { String }, optional: true, nullable: false, api_name: "nextPageToken"
      end
    end
  end
end
