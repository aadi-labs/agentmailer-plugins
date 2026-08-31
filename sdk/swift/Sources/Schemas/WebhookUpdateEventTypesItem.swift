import Foundation

public enum WebhookUpdateEventTypesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case inboxProvisioning = "inbox.provisioning"
    case inboxCreated = "inbox.created"
    case inboxProvisioningFailed = "inbox.provisioning_failed"
    case messageReceived = "message.received"
    case messageSendRequested = "message.send.requested"
    case messageSent = "message.sent"
    case messageDelivered = "message.delivered"
    case messageBounced = "message.bounced"
    case messageComplained = "message.complained"
    case messageRejected = "message.rejected"
    case domainVerified = "domain.verified"
    case a2ATaskCreated = "a2a.task.created"
    case a2ATaskMessage = "a2a.task.message"
    case a2ATaskCanceled = "a2a.task.canceled"
    case a2ASentTaskUpdated = "a2a.sent_task.updated"
}