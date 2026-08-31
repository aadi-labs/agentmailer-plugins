import Foundation

public enum MessageAttachmentsItemDisposition: String, Codable, Hashable, CaseIterable, Sendable {
    case attachment
    case inline
}