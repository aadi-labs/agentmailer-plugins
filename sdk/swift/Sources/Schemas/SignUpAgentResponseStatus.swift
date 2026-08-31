import Foundation

public enum SignUpAgentResponseStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pendingHumanApproval = "pending_human_approval"
}