import Foundation

public enum ChannelEndpointCapabilitiesItem: String, Codable, Hashable, CaseIterable, Sendable {
    case sms
    case mms
    case rcs
    case whatsapp
    case voice
}