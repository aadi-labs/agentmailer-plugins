# frozen_string_literal: true

module AgentMailer
  module Types
    class Webhook < Internal::Types::Model
      field :url, -> { String }, optional: false, nullable: false

      field :pod_id, -> { String }, optional: true, nullable: false, api_name: "podId"

      field :inbox_id, -> { String }, optional: true, nullable: false, api_name: "inboxId"

      field :event_types, -> { Internal::Types::Array[AgentMailer::Types::WebhookEventTypesItem] }, optional: false, nullable: false, api_name: "eventTypes"

      field :description, -> { String }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::WebhookStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
