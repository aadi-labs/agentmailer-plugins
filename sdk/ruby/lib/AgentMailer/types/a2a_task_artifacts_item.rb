# frozen_string_literal: true

module AgentMailer
  module Types
    class A2ATaskArtifactsItem < Internal::Types::Model
      field :artifact_id, -> { String }, optional: false, nullable: false, api_name: "artifactId"

      field :name, -> { String }, optional: true, nullable: false

      field :description, -> { String }, optional: true, nullable: false

      field :parts, -> { Internal::Types::Array[AgentMailer::Types::A2ATaskArtifactsItemPartsItem] }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :extensions, -> { Internal::Types::Array[String] }, optional: true, nullable: false
    end
  end
end
