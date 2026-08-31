import Foundation

public enum BillingAccountStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case trialing
    case pastDue = "past_due"
    case paused
    case canceled
    case unpaid
}