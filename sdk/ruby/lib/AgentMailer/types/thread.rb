# frozen_string_literal: true

module AgentMailer
  module Types
    class Thread < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :subject, -> { String }, optional: false, nullable: false

      field :participants, -> { Internal::Types::Array[AgentMailer::Types::ThreadParticipantsItem] }, optional: false, nullable: false

      field :message_count, -> { Integer }, optional: false, nullable: false, api_name: "messageCount"

      field :last_message_at, -> { String }, optional: false, nullable: false, api_name: "lastMessageAt"
    end
  end
end
