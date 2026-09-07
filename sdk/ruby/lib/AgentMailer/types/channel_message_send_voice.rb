# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendVoice < Internal::Types::Model
      field :endpoint_id, -> { String }, optional: false, nullable: false, api_name: "endpointId"

      field :to, -> { String }, optional: false, nullable: false

      field :consent, -> { AgentMailer::Types::ChannelMessageSendVoiceConsent }, optional: false, nullable: false

      field :content, -> { AgentMailer::Types::ChannelMessageSendVoiceContent }, optional: false, nullable: false

      field :text_type, -> { AgentMailer::Types::ChannelMessageSendVoiceTextType }, optional: true, nullable: false, api_name: "textType"

      field :voice_id, -> { String }, optional: true, nullable: false, api_name: "voiceId"
    end
  end
end
