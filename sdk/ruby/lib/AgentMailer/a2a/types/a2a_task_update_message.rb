# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      class A2ATaskUpdateMessage < Internal::Types::Model
        field :message_id, -> { String }, optional: false, nullable: false, api_name: "messageId"

        field :context_id, -> { String }, optional: true, nullable: false, api_name: "contextId"

        field :task_id, -> { String }, optional: true, nullable: false, api_name: "taskId"

        field :role, -> { AgentMailer::A2A::Types::A2ATaskUpdateMessageRole }, optional: false, nullable: false

        field :parts, -> { Internal::Types::Array[AgentMailer::A2A::Types::A2ATaskUpdateMessagePartsItem] }, optional: false, nullable: false

        field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false

        field :extensions, -> { Internal::Types::Array[String] }, optional: true, nullable: false

        field :reference_task_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "referenceTaskIds"
      end
    end
  end
end
