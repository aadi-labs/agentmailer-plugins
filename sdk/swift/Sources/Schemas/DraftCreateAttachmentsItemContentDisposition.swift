import Foundation

public enum DraftCreateAttachmentsItemContentDisposition: String, Codable, Hashable, CaseIterable, Sendable {
    case attachment
    case inline
}