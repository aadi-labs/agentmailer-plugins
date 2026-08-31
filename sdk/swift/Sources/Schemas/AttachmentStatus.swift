import Foundation

public enum AttachmentStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending
    case uploaded
    case committed
}