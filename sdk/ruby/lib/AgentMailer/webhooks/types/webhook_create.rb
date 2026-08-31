# frozen_string_literal: true

module AgentMailer
  module Webhooks
    module Types
      class WebhookCreate < Internal::Types::Model
        field :url, -> { String }, optional: false, nullable: false

        field :pod_id, -> { String }, optional: true, nullable: false, api_name: "podId"

        field :inbox_id, -> { String }, optional: true, nullable: false, api_name: "inboxId"

        field :event_types, -> { Internal::Types::Array[AgentMailer::Webhooks::Types::WebhookCreateEventTypesItem] }, optional: true, nullable: false, api_name: "eventTypes"

        field :description, -> { String }, optional: true, nullable: false
      end
    end
  end
end
