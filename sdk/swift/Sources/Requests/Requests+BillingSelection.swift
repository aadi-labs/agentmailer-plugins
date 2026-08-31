import Foundation

extension Requests {
    public struct BillingSelection: Codable, Hashable, Sendable {
        public let inboxes: Int?
        public let monthlyMessages: Int?
        public let customDomains: Int?
        public let interval: BillingSelectionInterval?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            inboxes: Int? = nil,
            monthlyMessages: Int? = nil,
            customDomains: Int? = nil,
            interval: BillingSelectionInterval? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.inboxes = inboxes
            self.monthlyMessages = monthlyMessages
            self.customDomains = customDomains
            self.interval = interval
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.inboxes = try container.decodeIfPresent(Int.self, forKey: .inboxes)
            self.monthlyMessages = try container.decodeIfPresent(Int.self, forKey: .monthlyMessages)
            self.customDomains = try container.decodeIfPresent(Int.self, forKey: .customDomains)
            self.interval = try container.decodeIfPresent(BillingSelectionInterval.self, forKey: .interval)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.inboxes, forKey: .inboxes)
            try container.encodeIfPresent(self.monthlyMessages, forKey: .monthlyMessages)
            try container.encodeIfPresent(self.customDomains, forKey: .customDomains)
            try container.encodeIfPresent(self.interval, forKey: .interval)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case inboxes
            case monthlyMessages
            case customDomains
            case interval
        }
    }
}