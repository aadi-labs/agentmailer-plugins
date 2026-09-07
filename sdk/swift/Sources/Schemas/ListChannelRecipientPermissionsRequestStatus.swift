import Foundation

public enum ListChannelRecipientPermissionsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case consented
    case optedOut = "opted_out"
}