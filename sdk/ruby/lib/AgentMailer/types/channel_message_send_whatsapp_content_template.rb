# frozen_string_literal: true

module AgentMailer
  module Types
    class ChannelMessageSendWhatsappContentTemplate < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :language_code, -> { String }, optional: false, nullable: false, api_name: "languageCode"

      field :components, -> { Internal::Types::Array[Internal::Types::Hash[String, Object]] }, optional: true, nullable: false
    end
  end
end
