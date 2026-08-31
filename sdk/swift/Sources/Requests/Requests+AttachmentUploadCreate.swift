import Foundation

extension Requests {
    public struct AttachmentUploadCreate: Codable, Hashable, Sendable {
        public let filename: String
        public let contentType: String
        public let size: Int
        public let checksumSha256: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            filename: String,
            contentType: String,
            size: Int,
            checksumSha256: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.filename = filename
            self.contentType = contentType
            self.size = size
            self.checksumSha256 = checksumSha256
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.filename = try container.decode(String.self, forKey: .filename)
            self.contentType = try container.decode(String.self, forKey: .contentType)
            self.size = try container.decode(Int.self, forKey: .size)
            self.checksumSha256 = try container.decode(String.self, forKey: .checksumSha256)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.filename, forKey: .filename)
            try container.encode(self.contentType, forKey: .contentType)
            try container.encode(self.size, forKey: .size)
            try container.encode(self.checksumSha256, forKey: .checksumSha256)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case filename
            case contentType
            case size
            case checksumSha256
        }
    }
}