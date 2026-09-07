# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendVoiceContent < Internal::Types::Model
      field :type, -> { AgentMailer::Types::ChannelMessageSendVoiceContentType }, optional: false, nullable: false

      field :body, -> { String }, optional: false, nullable: false
    end
  end
end
