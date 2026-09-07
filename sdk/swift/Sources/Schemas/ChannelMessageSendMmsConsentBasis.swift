import Foundation

public enum ChannelMessageSendMmsConsentBasis: String, Codable, Hashable, CaseIterable, Sendable {
    case explicit
    case transactionalRelationship = "transactional_relationship"
}