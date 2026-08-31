import Foundation

public enum WebhookStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case enabled
    case disabled
}