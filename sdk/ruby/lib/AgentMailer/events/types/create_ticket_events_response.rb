# frozen_string_literal: true

module AgentMailer
  module Events
    module Types
      class CreateTicketEventsResponse < Internal::Types::Model
        field :ticket, -> { String }, optional: false, nullable: false

        field :expires_in, -> { Integer }, optional: false, nullable: false, api_name: "expiresIn"

        field :websocket_url, -> { String }, optional: false, nullable: false, api_name: "websocketUrl"
      end
    end
  end
end
