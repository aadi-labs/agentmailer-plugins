# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsappContentMedia < Internal::Types::Model
      field :kind, -> { AgentMailer::Types::ChannelMessageSendWhatsappContentMediaKind }, optional: false, nullable: false

      field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"
    end
  end
end
