import Foundation

public struct BillingAccount: Codable, Hashable, Sendable {
    public let plan: BillingAccountPlan
    public let status: BillingAccountStatus
    public let stripeCustomerId: Nullable<String>
    public let stripeSubscriptionId: Nullable<String>
    public let currentPeriodEnd: Nullable<Date>
    public let inboxLimit: Nullable<Int>
    public let monthlySendLimit: Nullable<Int>
    public let customDomainLimit: Nullable<Int>
    public let billingInterval: Nullable<BillingAccountBillingInterval>
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        plan: BillingAccountPlan,
        status: BillingAccountStatus,
        stripeCustomerId: Nullable<String>,
        stripeSubscriptionId: Nullable<String>,
        currentPeriodEnd: Nullable<Date>,
        inboxLimit: Nullable<Int>,
        monthlySendLimit: Nullable<Int>,
        customDomainLimit: Nullable<Int>,
        billingInterval: Nullable<BillingAccountBillingInterval>,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.plan = plan
        self.status = status
        self.stripeCustomerId = stripeCustomerId
        self.stripeSubscriptionId = stripeSubscriptionId
        self.currentPeriodEnd = currentPeriodEnd
        self.inboxLimit = inboxLimit
        self.monthlySendLimit = monthlySendLimit
        self.customDomainLimit = customDomainLimit
        self.billingInterval = billingInterval
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.plan = try container.decode(BillingAccountPlan.self, forKey: .plan)
        self.status = try container.decode(BillingAccountStatus.self, forKey: .status)
        self.stripeCustomerId = try container.decode(Nullable<String>.self, forKey: .stripeCustomerId)
        self.stripeSubscriptionId = try container.decode(Nullable<String>.self, forKey: .stripeSubscriptionId)
        self.currentPeriodEnd = try container.decode(Nullable<Date>.self, forKey: .currentPeriodEnd)
        self.inboxLimit = try container.decode(Nullable<Int>.self, forKey: .inboxLimit)
        self.monthlySendLimit = try container.decode(Nullable<Int>.self, forKey: .monthlySendLimit)
        self.customDomainLimit = try container.decode(Nullable<Int>.self, forKey: .customDomainLimit)
        self.billingInterval = try container.decode(Nullable<BillingAccountBillingInterval>.self, forKey: .billingInterval)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.stripeCustomerId, forKey: .stripeCustomerId)
        try container.encode(self.stripeSubscriptionId, forKey: .stripeSubscriptionId)
        try container.encode(self.currentPeriodEnd, forKey: .currentPeriodEnd)
        try container.encode(self.inboxLimit, forKey: .inboxLimit)
        try container.encode(self.monthlySendLimit, forKey: .monthlySendLimit)
        try container.encode(self.customDomainLimit, forKey: .customDomainLimit)
        try container.encode(self.billingInterval, forKey: .billingInterval)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case plan
        case status
        case stripeCustomerId
        case stripeSubscriptionId
        case currentPeriodEnd
        case inboxLimit
        case monthlySendLimit
        case customDomainLimit
        case billingInterval
    }
}