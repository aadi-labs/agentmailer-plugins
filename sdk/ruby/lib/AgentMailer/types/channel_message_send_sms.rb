# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendSms < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :to, -> { String }, optional: false, nullable: false

      field :consent, -> { AgentMailer::Types::ChannelMessageSendSmsConsent }, optional: false, nullable: false

      field :content, -> { AgentMailer::Types::ChannelMessageSendSmsContent }, optional: false, nullable: false

      field :message_type, -> { AgentMailer::Types::ChannelMessageSendSmsMessageType }, optional: true, nullable: false, api_name: "messageType"
    end
  end
end
