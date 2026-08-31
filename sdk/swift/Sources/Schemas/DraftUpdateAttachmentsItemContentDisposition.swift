import Foundation

public enum DraftUpdateAttachmentsItemContentDisposition: String, Codable, Hashable, CaseIterable, Sendable {
    case attachment
    case inline
}