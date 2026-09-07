# frozen_string_literal: true

module AgentMailer
  module ChannelRecipientPermissions
    module Types
      class ListChannelRecipientPermissionsResponse < Internal::Types::Model
        field :permissions, -> { Internal::Types::Array[AgentMailer::Types::ChannelRecipientPermission] }, optional: false, nullable: false

        field :next_page_token, -> { String }, optional: false, nullable: false, api_name: "nextPageToken"
      end
    end
  end
end
