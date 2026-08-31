# frozen_string_literal: true

module AgentMailer
  module Types
    class A2ATaskStatusMessage < Internal::Types::Model
      field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"

      field :context_id, -> { String }, optional: true, nullable: false, api_name: "contextId"

      field :task_id, -> { String }, optional: true, nullable: false, api_name: "taskId"

      field :role, -> { AgentMailer::Types::A2ATaskStatusMessageRole }, optional: false, nullable: false

      field :parts, -> { Internal::Types::Array[AgentMailer::Types::A2ATaskStatusMessagePartsItem] }, optional: false, nullable: false

      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

      field :extensions, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :reference_task_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "referenceTaskIds"
    end
  end
end
