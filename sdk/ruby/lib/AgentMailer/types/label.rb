# frozen_string_literal: true

module AgentMailer
  module Types
    class Label < Internal::Types::Model
      field :pod_id, -> { String }, optional: false, nullable: false, api_name: "podId"

      field :name, -> { String }, optional: false, nullable: false

      field :color, -> { String }, optional: true, nullable: false

      field :id, -> { String }, optional: false, nullable: false

      field :created_at, -> { String }, optional: false, nullable: false, api_name: "createdAt"
    end
  end
end
