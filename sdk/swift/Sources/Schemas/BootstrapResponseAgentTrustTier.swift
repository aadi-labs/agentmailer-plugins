import Foundation

public enum BootstrapResponseAgentTrustTier: String, Codable, Hashable, CaseIterable, Sendable {
    case bootstrap
    case verified
    case established
}