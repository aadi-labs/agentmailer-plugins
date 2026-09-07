import Foundation

extension Requests {
    public struct ChannelEndpointCreate: Codable, Hashable, Sendable {
        public let inboxId: String
        public let podId: String
        public let channel: ChannelEndpointCreateChannel
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            inboxId: String,
            podId: String,
            channel: ChannelEndpointCreateChannel,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.inboxId = inboxId
            self.podId = podId
            self.channel = channel
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.inboxId = try container.decode(String.self, forKey: .inboxId)
            self.podId = try container.decode(String.self, forKey: .podId)
            self.channel = try container.decode(ChannelEndpointCreateChannel.self, forKey: .channel)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.inboxId, forKey: .inboxId)
            try container.encode(self.podId, forKey: .podId)
            try container.encode(self.channel, forKey: .channel)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case inboxId
            case podId
            case channel
        }
    }
}