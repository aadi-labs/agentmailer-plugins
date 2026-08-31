# frozen_string_literal: true

module AgentMailer
  module A2A
    module Types
      module A2ATaskUpdateState
        extend AgentMailer::Internal::Types::Enum

        TASK_STATE_SUBMITTED = "TASK_STATE_SUBMITTED"
        TASK_STATE_WORKING = "TASK_STATE_WORKING"
        TASK_STATE_COMPLETED = "TASK_STATE_COMPLETED"
        TASK_STATE_FAILED = "TASK_STATE_FAILED"
        TASK_STATE_CANCELED = "TASK_STATE_CANCELED"
        TASK_STATE_INPUT_REQUIRED = "TASK_STATE_INPUT_REQUIRED"
        TASK_STATE_REJECTED = "TASK_STATE_REJECTED"
        TASK_STATE_AUTH_REQUIRED = "TASK_STATE_AUTH_REQUIRED"
      end
    end
  end
end
