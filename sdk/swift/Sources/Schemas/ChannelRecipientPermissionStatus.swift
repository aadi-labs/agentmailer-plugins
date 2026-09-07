import Foundation

public enum ChannelRecipientPermissionStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case consented
    case optedOut = "opted_out"
}