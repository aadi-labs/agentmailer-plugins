import Foundation

public enum MailProtocolEndpointSecurity: String, Codable, Hashable, CaseIterable, Sendable {
    case tls
    case starttls
}