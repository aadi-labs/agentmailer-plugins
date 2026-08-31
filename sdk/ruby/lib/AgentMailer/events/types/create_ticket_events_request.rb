# frozen_string_literal: true

module AgentMailer
  module Events
    module Types
      class CreateTicketEventsRequest < Internal::Types::Model
        field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"
      end
    end
  end
end
