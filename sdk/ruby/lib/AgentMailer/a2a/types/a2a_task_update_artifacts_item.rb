# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2ATaskUpdateArtifactsItem < Internal::Types::Model
        field :artifact_id, -> { String }, optional: false, nullable: false, api_name: "artifactId"

        field :name, -> { String }, optional: true, nullable: false

        field :description, -> { String }, optional: true, nullable: false

        field :parts, -> { Internal::Types::Array[AgentMailer::A2A::Types::A2ATaskUpdateArtifactsItemPartsItem] }, optional: false, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :extensions, -> { Internal::Types::Array[String] }, optional: true, nullable: false
      end
    end
  end
end
