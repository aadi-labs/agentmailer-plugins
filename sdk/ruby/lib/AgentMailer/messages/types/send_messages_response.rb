# frozen_string_literal: true

module AgentMailer
  module Messages
    module Types
      class SendMessagesResponse < Internal::Types::Model
        field :message, -> { AgentMailer::Types::Message }, optional: false, nullable: false
      end
    end
  end
end
