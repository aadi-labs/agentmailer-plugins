# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsappContentText < Internal::Types::Model
      field :body, -> { String }, optional: false, nullable: false
    end
  end
end
