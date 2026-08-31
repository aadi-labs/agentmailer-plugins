import Foundation

public enum DraftAttachmentsItemContentDisposition: String, Codable, Hashable, CaseIterable, Sendable {
    case attachment
    case inline
}