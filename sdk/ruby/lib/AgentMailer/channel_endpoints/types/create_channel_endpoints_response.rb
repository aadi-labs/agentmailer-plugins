# frozen_string_literal: true

module AgentMailer
  module ChannelEndpoints
    module Types
      class CreateChannelEndpointsResponse < Internal::Types::Model
        field :endpoint, -> { AgentMailer::Types::ChannelEndpoint }, optional: false, nullable: false
      end
    end
  end
end
