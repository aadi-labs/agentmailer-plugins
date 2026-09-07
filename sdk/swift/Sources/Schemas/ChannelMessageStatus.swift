import Foundation

public enum ChannelMessageStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case queued
    case sent
    case delivered
    case read
    case failed
    case received
    case blocked
}