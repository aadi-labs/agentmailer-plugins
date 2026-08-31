import Foundation

public enum A2ATaskStatusState: String, Codable, Hashable, CaseIterable, Sendable {
    case taskStateSubmitted = "TASK_STATE_SUBMITTED"
    case taskStateWorking = "TASK_STATE_WORKING"
    case taskStateCompleted = "TASK_STATE_COMPLETED"
    case taskStateFailed = "TASK_STATE_FAILED"
    case taskStateCanceled = "TASK_STATE_CANCELED"
    case taskStateInputRequired = "TASK_STATE_INPUT_REQUIRED"
    case taskStateRejected = "TASK_STATE_REJECTED"
    case taskStateAuthRequired = "TASK_STATE_AUTH_REQUIRED"
}