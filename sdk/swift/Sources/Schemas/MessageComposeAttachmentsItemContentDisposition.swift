import Foundation

public enum MessageComposeAttachmentsItemContentDisposition: String, Codable, Hashable, CaseIterable, Sendable {
    case attachment
    case inline
}