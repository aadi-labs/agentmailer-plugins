# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2ATaskUpdateArtifactsItemPartsItem < Internal::Types::Model
        field :text, -> { String }, optional: true, nullable: false

        field :raw, -> { String }, optional: true, nullable: false

        field :url, -> { String }, optional: true, nullable: false

        field :data, -> { Object }, optional: true, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :filename, -> { String }, optional: true, nullable: false

        field :media_type, -> { String }, optional: true, nullable: false, api_name: "mediaType"
      end
    end
  end
end
