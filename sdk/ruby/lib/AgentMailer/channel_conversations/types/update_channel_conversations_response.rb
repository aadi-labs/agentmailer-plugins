# frozen_string_literal: true

module AgentMailer
  module ChannelConversations
    module Types
      class UpdateChannelConversationsResponse < Internal::Types::Model
        field :conversation, -> { AgentMailer::Types::ChannelConversation }, optional: false, nullable: false
      end
    end
  end
end
