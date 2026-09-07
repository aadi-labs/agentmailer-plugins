# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsappContentButtons < Internal::Types::Model
      field :body, -> { String }, optional: false, nullable: false

      field :buttons, -> { Internal::Types::Array[AgentMailer::Types::ChannelMessageSendWhatsappContentButtonsButtonsItem] }, optional: false, nullable: false
    end
  end
end
