import Foundation

public enum ChannelMessageSendVoiceTextType: String, Codable, Hashable, CaseIterable, Sendable {
    case text
    case ssml
}