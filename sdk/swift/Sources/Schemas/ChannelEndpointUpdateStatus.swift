import Foundation

public enum ChannelEndpointUpdateStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case disabled
}