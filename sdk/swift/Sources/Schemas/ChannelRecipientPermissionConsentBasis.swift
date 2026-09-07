import Foundation

public enum ChannelRecipientPermissionConsentBasis: String, Codable, Hashable, CaseIterable, Sendable {
    case explicit
    case transactionalRelationship = "transactional_relationship"
    case inboundKeyword = "inbound_keyword"
}