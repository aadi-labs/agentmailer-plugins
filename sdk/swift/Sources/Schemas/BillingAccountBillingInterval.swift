import Foundation

public enum BillingAccountBillingInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case month
    case year
}