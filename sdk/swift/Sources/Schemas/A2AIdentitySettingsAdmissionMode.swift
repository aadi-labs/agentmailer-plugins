import Foundation

public enum A2AIdentitySettingsAdmissionMode: String, Codable, Hashable, CaseIterable, Sendable {
    case whitelist
    case `public`
}