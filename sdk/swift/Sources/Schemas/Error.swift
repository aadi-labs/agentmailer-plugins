import Foundation

public struct Error: Codable, Hashable, Sendable {
    public let type: String
    public let title: String
    public let status: Int
    public let code: String
    public let detail: String?
    public let requestId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: String,
        title: String,
        status: Int,
        code: String,
        detail: String? = nil,
        requestId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.title = title
        self.status = status
        self.code = code
        self.detail = detail
        self.requestId = requestId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.title = try container.decode(String.self, forKey: .title)
        self.status = try container.decode(Int.self, forKey: .status)
        self.code = try container.decode(String.self, forKey: .code)
        self.detail = try container.decodeIfPresent(String.self, forKey: .detail)
        self.requestId = try container.decode(String.self, forKey: .requestId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.code, forKey: .code)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encode(self.requestId, forKey: .requestId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case title
        case status
        case code
        case detail
        case requestId
    }
}