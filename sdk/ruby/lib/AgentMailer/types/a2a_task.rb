# frozen_string_literal: true

module AgentMailer
  module Types
    class A2ATask < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :context_id, -> { String }, optional: false, nullable: false, api_name: "contextId"

      field :status, -> { AgentMailer::Types::A2ATaskStatus }, optional: false, nullable: false

      field :artifacts, -> { Internal::Types::Array[AgentMailer::Types::A2ATaskArtifactsItem] }, optional: true, nullable: false

      field :history, -> { Internal::Types::Array[AgentMailer::Types::A2ATaskHistoryItem] }, optional: true, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
