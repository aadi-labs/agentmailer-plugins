# frozen_string_literal: true

module AgentMailer
  module ChannelRecipientPermissions
    module Types
      class ListChannelRecipientPermissionsRequest < Internal::Types::Model
        field :limit, -> { Integer }, optional: true, nullable: false

        field :page_token, -> { String }, optional: true, nullable: false, api_name: "pageToken"

        field :endpoint_id, -> { String }, optional: true, nullable: false, api_name: "endpointId"

        field :channel, -> { AgentMailer::ChannelRecipientPermissions::Types::ListChannelRecipientPermissionsRequestChannel }, optional: true, nullable: false

        field :status, -> { AgentMailer::ChannelRecipientPermissions::Types::ListChannelRecipientPermissionsRequestStatus }, optional: true, nullable: false
      end
    end
  end
end
