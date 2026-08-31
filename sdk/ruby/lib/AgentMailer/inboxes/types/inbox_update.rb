# frozen_string_literal: true

module AgentMailer
  module Inboxes
    module Types
      class InboxUpdate < Internal::Types::Model
        field :inbox_id, -> { String }, optional: false, nullable: false, api_name: "inboxId"

        field :display_name, -> { String }, optional: true, nullable: false, api_name: "displayName"

        field :client_id, -> { String }, optional: true, nullable: false, api_name: "clientId"

        field :metadata, -> { Internal::Types::Hash[String, AgentMailer::Inboxes::Types::InboxUpdateMetadataValue] }, optional: true, nullable: false
      end
    end
  end
end
