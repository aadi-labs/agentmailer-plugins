# frozen_string_literal: true

module AgentMailer
  module ChannelConversations
    module Types
      class ChannelConversationUpdate < Internal::Types::Model
        field :conversation_id, -> { String }, optional: false, nullable: false, api_name: "conversationId"

        field :status, -> { AgentMailer::ChannelConversations::Types::ChannelConversationUpdateStatus }, optional: false, nullable: false
      end
    end
  end
end
