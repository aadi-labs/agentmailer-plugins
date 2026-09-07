# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendMmsContent < Internal::Types::Model
      field :type, -> { AgentMailer::Types::ChannelMessageSendMmsContentType }, optional: false, nullable: false

      field :body, -> { String }, optional: false, nullable: false
    end
  end
end
