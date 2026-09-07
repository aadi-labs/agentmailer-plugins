# frozen_string_literal: true

module AgentMailer
  module ChannelEndpoints
    module Types
      class ChannelEndpointCreate < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

        field :channel, -> { AgentMailer::ChannelEndpoints::Types::ChannelEndpointCreateChannel }, optional: false, nullable: false
      end
    end
  end
end
