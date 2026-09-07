# frozen_string_literal: true

module AgentMailer
  module ChannelEndpoints
    module Types
      class ListChannelEndpointsResponse < Internal::Types::Model
        field :endpoints, -> { Internal::Types::Array[AgentMailer::Types::ChannelEndpoint] }, optional: false, nullable: false
      end
    end
  end
end
