# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendSmsContent < Internal::Types::Model
      field :type, -> { AgentMailer::Types::ChannelMessageSendSmsContentType }, optional: false, nullable: false

      field :body, -> { String }, optional: false, nullable: false
    end
  end
end
