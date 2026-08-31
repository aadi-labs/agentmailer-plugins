import Foundation

public enum BillingAccountPlan: String, Codable, Hashable, CaseIterable, Sendable {
    case free
    case developer
    case startup
    case enterprise
}