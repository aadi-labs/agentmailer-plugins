# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2ATaskUpdate < Internal::Types::Model
        field :task_id, -> { String }, optional: false, nullable: false, api_name: "taskId"

        field :state, -> { AgentMailer::A2A::Types::A2ATaskUpdateState }, optional: false, nullable: false

        field :message, -> { AgentMailer::A2A::Types::A2ATaskUpdateMessage }, optional: true, nullable: false

        field :artifacts, -> { Internal::Types::Array[AgentMailer::A2A::Types::A2ATaskUpdateArtifactsItem] }, optional: true, nullable: false
      end
    end
  end
end
