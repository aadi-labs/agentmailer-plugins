# frozen_string_literal: true

module AgentMailer
  module ChannelEndpoints
    module Types
      class ChannelEndpointUpdate < Internal::Types::Model
        field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

        field :status, -> { AgentMailer::ChannelEndpoints::Types::ChannelEndpointUpdateStatus }, optional: false, nullable: false
      end
    end
  end
end
