import Foundation

public enum ChannelMessageSendWhatsappConsentBasis: String, Codable, Hashable, CaseIterable, Sendable {
    case explicit
    case transactionalRelationship = "transactional_relationship"
}