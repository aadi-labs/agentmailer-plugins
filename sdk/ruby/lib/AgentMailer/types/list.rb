# frozen_string_literal: true

module AgentMailer
  module Types
    class List < Internal::Types::Model
      field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

      field :name, -> { String }, optional: false, nullable: false

      field :kind, -> { AgentMailer::Types::ListKind }, optional: false, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :entries, -> { Internal::Types::Array[AgentMailer::Types::ListEntriesItem] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
