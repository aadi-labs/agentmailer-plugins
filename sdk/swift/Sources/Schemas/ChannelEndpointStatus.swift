import Foundation

public enum ChannelEndpointStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case provisioning
    case active
    case disabled
    case failed
}