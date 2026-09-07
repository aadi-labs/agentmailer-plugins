import Foundation

public enum ChannelMessageSendRcsConsentBasis: String, Codable, Hashable, CaseIterable, Sendable {
    case explicit
    case transactionalRelationship = "transactional_relationship"
}