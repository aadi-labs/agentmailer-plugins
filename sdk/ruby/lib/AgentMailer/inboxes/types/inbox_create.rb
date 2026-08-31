# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class InboxCreate < Internal::Types::Model
        field :username, -> { String }, optional: true, nullable: false

        field :pod_id, -> { String }, optional: true, nullable: false, api_name: "podId"

        field :domain_id, -> { String }, optional: true, nullable: false, api_name: "domainId"

        field :client_id, -> { String }, optional: true, nullable: false, api_name: "clientId"

        field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

        field :metadata, -> { Internal::Types::Hash[String, AgentMailer::Inboxes::Types::InboxCreateMetadataValue] }, optional: true, nullable: false
      end
    end
  end
end
