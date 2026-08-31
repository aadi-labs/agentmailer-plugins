import Foundation

public enum ReplyComposeAttachmentsItemContentDisposition: String, Codable, Hashable, CaseIterable, Sendable {
    case attachment
    case inline
}