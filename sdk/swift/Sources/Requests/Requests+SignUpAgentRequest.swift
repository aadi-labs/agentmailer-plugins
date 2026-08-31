import Foundation

extension Requests {
    public struct SignUpAgentRequest: Codable, Hashable, Sendable {
        public let humanEmail: String
        public let username: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            humanEmail: String,
            username: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.humanEmail = humanEmail
            self.username = username
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.humanEmail = try container.decode(String.self, forKey: .humanEmail)
            self.username = try container.decode(String.self, forKey: .username)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.humanEmail, forKey: .humanEmail)
            try container.encode(self.username, forKey: .username)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case humanEmail = "human_email"
            case username
        }
    }
}