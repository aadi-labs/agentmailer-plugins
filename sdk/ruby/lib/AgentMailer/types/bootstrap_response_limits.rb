# frozen_string_literal: true

module AgentMailer
  module Types
    class BootstrapResponseLimits < Internal::Types::Model
      field :messages_per_day, -> { Integer }, optional: false, nullable: false, api_name: "messagesPerDay"

      field :recipients_per_message, -> { Integer }, optional: false, nullable: false, api_name: "recipientsPerMessage"

      field :attachment_bytes, -> { Integer }, optional: false, nullable: false, api_name: "attachmentBytes"
    end
  end
end
