import Foundation

public struct Domain: Codable, Hashable, Sendable {
    public let id: String
    public let podId: Nullable<String>
    public let domain: String
    public let status: DomainStatus
    public let records: [DomainRecordsItem]
    public let createdAt: Date
    public let updatedAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        podId: Nullable<String>,
        domain: String,
        status: DomainStatus,
        records: [DomainRecordsItem],
        createdAt: Date,
        updatedAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.podId = podId
        self.domain = domain
        self.status = status
        self.records = records
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.podId = try container.decode(Nullable<String>.self, forKey: .podId)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.status = try container.decode(DomainStatus.self, forKey: .status)
        self.records = try container.decode([DomainRecordsItem].self, forKey: .records)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.updatedAt = try container.decode(Date.self, forKey: .updatedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.podId, forKey: .podId)
        try container.encode(self.domain, forKey: .domain)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.records, forKey: .records)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.updatedAt, forKey: .updatedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case podId
        case domain
        case status
        case records
        case createdAt
        case updatedAt
    }
}