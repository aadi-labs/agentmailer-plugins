import Foundation

public struct A2ATaskHistoryItemPartsItem: Codable, Hashable, Sendable {
    public let text: String?
    public let raw: String?
    public let url: String?
    public let data: JSONValue?
    public let metadata: [String: JSONValue]?
    public let filename: String?
    public let mediaType: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        text: String? = nil,
        raw: String? = nil,
        url: String? = nil,
        data: JSONValue? = nil,
        metadata: [String: JSONValue]? = nil,
        filename: String? = nil,
        mediaType: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.text = text
        self.raw = raw
        self.url = url
        self.data = data
        self.metadata = metadata
        self.filename = filename
        self.mediaType = mediaType
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.raw = try container.decodeIfPresent(String.self, forKey: .raw)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.data = try container.decodeIfPresent(JSONValue.self, forKey: .data)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.filename = try container.decodeIfPresent(String.self, forKey: .filename)
        self.mediaType = try container.decodeIfPresent(String.self, forKey: .mediaType)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.raw, forKey: .raw)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.filename, forKey: .filename)
        try container.encodeIfPresent(self.mediaType, forKey: .mediaType)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case text
        case raw
        case url
        case data
        case metadata
        case filename
        case mediaType
    }
}