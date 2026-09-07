# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsappContentButtonsButtonsItem < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :title, -> { String }, optional: false, nullable: false
    end
  end
end
