# frozen_string_literal: true

module AgentMailer
  module ChannelMessages
    module Types
      class SendChannelMessagesResponse < Internal::Types::Model
        field :message, -> { AgentMailer::Types::ChannelMessage }, optional: false, nullable: false

        field :replayed, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
