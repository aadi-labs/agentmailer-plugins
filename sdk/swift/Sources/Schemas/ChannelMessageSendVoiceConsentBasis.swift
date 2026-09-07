import Foundation

public enum ChannelMessageSendVoiceConsentBasis: String, Codable, Hashable, CaseIterable, Sendable {
    case explicit
    case transactionalRelationship = "transactional_relationship"
}