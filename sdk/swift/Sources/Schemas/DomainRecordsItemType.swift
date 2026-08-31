import Foundation

public enum DomainRecordsItemType: String, Codable, Hashable, CaseIterable, Sendable {
    case cname = "CNAME"
    case mx = "MX"
    case txt = "TXT"
}