# frozen_string_literal: true

module AgentMailer
  module Webhooks
    module Types
      class WebhookUpdate < Internal::Types::Model
        field :webhook_id, -> { String }, optional: false, nullable: false, api_name: "webhookId"

        field :url, -> { String }, optional: true, nullable: false

        field :event_types, -> { Internal::Types::Array[AgentMailer::Webhooks::Types::WebhookUpdateEventTypesItem] }, optional: true, nullable: false, api_name: "eventTypes"

        field :description, -> { String }, optional: true, nullable: false

        field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      end
    end
  end
end
