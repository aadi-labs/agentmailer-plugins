import Foundation

public enum MessageStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case sent
    case delivered
    case bounced
    case complained
    case rejected
    case received
}