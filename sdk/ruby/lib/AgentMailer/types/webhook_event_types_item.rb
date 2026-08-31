# frozen_string_literal: true

module AgentMailer
  module Types
    module WebhookEventTypesItem
      extend AgentMailer::Internal::Types::Enum

      INBOX_PROVISIONING = "inbox.provisioning"
      INBOX_CREATED = "inbox.created"
      INBOX_PROVISIONING_FAILED = "inbox.provisioning_failed"
      MESSAGE_RECEIVED = "message.received"
      MESSAGE_SEND_REQUESTED = "message.send.requested"
      MESSAGE_SENT = "message.sent"
      MESSAGE_DELIVERED = "message.delivered"
      MESSAGE_BOUNCED = "message.bounced"
      MESSAGE_COMPLAINED = "message.complained"
      MESSAGE_REJECTED = "message.rejected"
      DOMAIN_VERIFIED = "domain.verified"
      A2A_TASK_CREATED = "a2a.task.created"
      A2A_TASK_MESSAGE = "a2a.task.message"
      A2A_TASK_CANCELED = "a2a.task.canceled"
      A2A_SENT_TASK_UPDATED = "a2a.sent_task.updated"
    end
  end
end
