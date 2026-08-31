# frozen_string_literal: true

module AgentMailer
  module Types
    class Domain < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :pod_id, -> { String }, optional: false, nullable: true, api_name: "podId"

      field :domain, -> { String }, optional: false, nullable: false

      field :status, -> { AgentMailer::Types::DomainStatus }, optional: false, nullable: false

      field :records, -> { Internal::Types::Array[AgentMailer::Types::DomainRecordsItem] }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"

      field :updated_at, -> { String }, optional: false, nullable: false, api_name: "updatedAt"
    end
  end
end
