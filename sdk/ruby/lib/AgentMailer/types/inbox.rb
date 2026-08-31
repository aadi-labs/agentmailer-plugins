# frozen_string_literal: true

module AgentMailer
  module Types
    class Inbox < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

      field :address, -> { String }, optional: false, nullable: false

      field :display_name, -> { String }, optional: false, nullable: true, api_name: "displayName"

      field :client_id, -> { String }, optional: false, nullable: true, api_name: "clientId"

      field :metadata, -> { Internal::Types::Hash[String, AgentMailer::Types::InboxMetadataValue] }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::InboxStatus }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
