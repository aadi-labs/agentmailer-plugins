# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelEndpoint < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

      field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

      field :channel, -> { AgentMailer::Types::ChannelEndpointChannel }, optional: false, nullable: false

      field :address, -> { String }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::ChannelEndpointStatus }, optional: false, nullable: false

      field :capabilities, -> { Internal::Types::Array[AgentMailer::Types::ChannelEndpointCapabilitiesItem] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
