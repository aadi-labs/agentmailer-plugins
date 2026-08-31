# frozen_string_literal: true

module AgentMailer
  module Threads
    module Types
      class GetThreadsResponse < Internal::Types::Model
        field :thread, -> { AgentMailer::Types::Thread }, optional: false, nullable: false

        field :messages, -> { Internal::Types::Array[AgentMailer::Types::Message] }, optional: false, nullable: false
      end
    end
  end
end
