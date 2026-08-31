import Foundation

public struct ListThreadsResponse: Codable, Hashable, Sendable {
    public let threads: [Thread]
    public let nextPageToken: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        threads: [Thread],
        nextPageToken: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.threads = threads
        self.nextPageToken = nextPageToken
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.threads = try container.decode([Thread].self, forKey: .threads)
        self.nextPageToken = try container.decodeIfPresent(String.self, forKey: .nextPageToken)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.threads, forKey: .threads)
        try container.encodeIfPresent(self.nextPageToken, forKey: .nextPageToken)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case threads
        case nextPageToken
    }
}